require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', database: 'ga-links', host: 'localhost'}

class Link < ActiveRecord::Base
  has_many :discussions
end

class Discussion < ActiveRecord::Base
  belongs_to :link
end



get '/links/' do 
  @links = Link.all
  erb :link_index
end

post '/links/:id/delete' do
  @link = Link.find(params[:id])
  @link.delete
  redirect "/links/"
end

get '/links/:id' do
  @link = Link.find(params[:id])
  erb :link_discuss
end

post '/links/create' do
  new_id = (0...3).map { (1 + rand(8)) }.join
  @link = Link.create(long_url: params[:long_url])
  @link[:id] = new_id
  @link[:short_url] = "localhost:4567/links/#{@link.id}"
  @link.save
  redirect "/links/"
end

post '/links/comment/:id' do
  @link = Link.find(params[:id])
  @link.discussions.create(author: params[:author], body: params[:body])
  redirect "/links/#{params[:id]}"
end



