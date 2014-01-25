require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
				database: 'shorturl',
				host: 'localhost'}

class Short < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :short
end

get '/shortener' do
	@shorts = Short.all
	erb :index
end

post '/shortener/create' do
	link_new = Short.create(original: params[:original])
	shortened_link = (0...5).map { (65 + rand(26)).chr }.join.downcase
	link_new.url = shortened_link
	link_new.save

	redirect "/shortener"
end

get '/shortener/discuss/:id' do
	@short = Short.find(params[:id])

	erb :single_page
end

get '/shortener/:id' do
	link = Short.find(params[:id]).original
	redirect "http://#{link}"
end

post "/shortener/:id/delete" do
	Short.find(params[:id]).delete
	redirect '/shortener'
end

post '/comment/:id/new' do
	@short = Short.find(params[:id])
	@short.comments.create(author: params[:author], body: params[:body])

	redirect "/shortener/discuss/#{params[:id]}"

end