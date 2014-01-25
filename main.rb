require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'ga-bitly',
                host: 'localhost'}

class Link < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :link
end

get '/' do
  @links = Link.all.order("updated_at DESC")
  erb :index
end

get '/links/:id' do
  redirectlink = Link.find(params[:id]).originalurl
  redirect "http://#{redirectlink}"
end

get '/links/:id/discuss' do
  @link = Link.find(params[:id])
  erb :discuss
end

post '/links/create' do
  new_link_id = Link.create(originalurl: params[:originalurl]).id
  shorturl = "/link/#{new_link_id}"
  Link.update(new_link_id, shorturl: shorturl)
  redirect '/'
end

post '/links/back' do
  redirect '/'
end

post '/links/:id/discuss/comment' do
  Link.find(params[:id]).comments.create(author: params[:author], body: params[:body])
  redirect "/links/#{params[:id]}/discuss"
end

post '/links/:id/discuss/delete_comment' do
  redirectid = Comment.find(params[:id]).link_id
  Comment.find(params[:id]).destroy
  redirect "/links/#{redirectid}/discuss"
end

post '/links/:id/delete' do
  Link.find(params[:id]).destroy
  redirect '/'
end
