require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'rake'
require 'google_url_shortener'
require 'dotenv'
Dotenv.load

set :database, {adapter: 'postgresql', database: 'shortlinks', host: 'localhost'}

Google::UrlShortener::Base.api_key = ENV["KEY"]

class Link < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :link
end

# Gets all links and displays them on the index page. 
get '/shortlinks' do
	@links = Link.all
	erb :link_index
end

# Gets one link's info and goes to the view/discuss page. 
get '/shortlinks/:id' do
	@link = Link.find(params[:id])
	erb :link_solo
end

#link_index.erb shorten link via submit button, redirects to link_index.erb
post '/shortlinks/shorten' do
	short_url = Google::UrlShortener.shorten!(params[:long_url])
	Link.create(url: params[:long_url], short_url: short_url)
	redirect '/shortlinks'
end

#link_solo.erb submit comment and redirect to link_index.erb
post '/shortlinks/comment/:id' do
	@link = Link.find(params[:id])
	@link.comments.create(params[:id], author: params[:author], body: params[:body])
	redirect '/shortlinks/:id'
end






