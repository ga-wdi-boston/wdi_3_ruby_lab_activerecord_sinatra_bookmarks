require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'ga-links',
                host: 'localhost'}

class Link < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :link
end


get '/' do
	@links = Link.all
	erb :index
end

post '/link/new' do
	new_id = Link.create(original: params[:original]).id
	new_link = "/link/#{new_id}"
	Link.update(new_id, short: new_link)
	redirect '/'
end

get '/discuss/:id' do
	@link = Link.find(params[:id])
	erb :discuss
end


get '/link/:id' do
	id = params[:id]
	link = Link.find(id).original
	redirect link
end

post '/link/:id/delete' do
	Link.find(params[:id]).destroy
	redirect '/'
end

post '/comment/:id/new' do
	Link.find(params[:id]).comments.create(author: params[:author], body: params[:body])
	redirect '/'
end

post '/comment/:id/delete' do
	Comment.find(params[:id]).destroy
	redirect '/'
end

