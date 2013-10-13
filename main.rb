require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'url_short_db',
                host: 'localhost'}

class Url < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :url
end

get '/index' do
  @urls = Url.all
  binding.pry
  erb :url_index
end


#I am thinking that this will allow me to print the time created, but I am unsure and will leave this commented out until the rest is working
# get '/index/time' do
#   @urls = Url.all.order("created_at DESC")
#   erb :url_index
# end

get '/index/new' do
  @urls = Url.all
  erb :url_new
end

post '/index/create' do
  @urls = Url.long_url
#this is my attempt at converting the long url to short url
  @urls.each do |url|
    url.new_url= 'foo.com'
  end

 redirect '/index'
  end


#i deleted the /discuss path and will be included in/:id
get '/index/:id' do
  url_id = params[:id]
    @url = Url.find(params[:id])
    
  erb :url_discuss
end


#I am adding a post to update the comments table when a new comment is made in the discussion page
