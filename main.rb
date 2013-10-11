require 'pg'
require 'pry'
require 'rake'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: "postgresql",
								database: "ga-shortner", 
								host: "localhost"}	

class Link < ActiveRecord::Base
	has_many :comments
end	

class Comment < ActiveRecord::Base
	belongs_to :link
end

get '/link/index' do
	@links = Link.all
	erb :link_index
end

post '/link/shorten' do #think of this as an update
	@link = Link.create(long_url: params[:long_url])
	@link.update(short_url: "localhost:4567/#{@link["id"]}")
	redirect "/link/index"
end

get '/link/:id/comments' do
	@comment = Comment.find(params[:id])
	erb :comment_link
end

post '/comment/create' do 
	@comment = Comment.create()
