require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
				database: 'url-shortener',
				host: 'localhost'}

class Link < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :link
end

get '/shortlink/' do
  @links = Link.all
  erb :index
end

post '/shortlink/shorten' do
  random_letters = (0...5).map{ ('a'..'z').to_a[rand(26)] }.join
  Link.create(url: params[:url], short_url: random_letters)
  redirect '/shortlink/'
end

get '/shortlink/discuss/:id' do
  @link = Link.find(params[:id])
  erb :discuss
end

post '/shortlink/discuss/:id/add-comment' do
  Comment.create(author: params[:author], body: params[:body], link_id: params[:id])
  redirect "/shortlink/discuss/#{params[:id]}"
end

get '/shortlink/:id' do
  link = Link.find(params[:id]).url
  redirect link
end

post '/shortlink/:id/delete-link' do
  Link.delete(params[:id])
  redirect '/shortlink/'
end

