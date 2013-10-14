require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'url_short_db',
                host: 'localhost'}

class Url < ActiveRecord::Base
  # #learned about these from a screencast tutorial
  # validates_uniqueness_of :url
  # validates_presence_of :url
  # validates_format_of :url, : with => /^\b((?:https?:\/\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))$/

  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :url
end

get '/' do
  #this assigns urls instant var to the entire Url table and sorts by updated_at value in decending order
  @urls = Url.all.order("updated_at DESC")
  erb :url_index
end


#I am thinking that this will allow me to print the time created, but I am unsure and will leave this commented out until the rest is working
# get '/time' do
#   @urls = Url.all.order("created_at DESC")
#   erb :url_index
# end

get '/new' do
  @urls = Url.all
  erb :url_index
end
#!_!_!_!_! i will now need to create an input with the name "long_url"
post '/create' do
  new_id = Url.long_url(long_url: params[:long_url])
#this is my attempt at converting the long url to short url
  @urls.each do |url|
    url.new_url= 'foo.com'
  end

 redirect '/'
end


#i deleted the /discuss path and will be included in /:id
get '/:id' do
  url_id = params[:id]
    @url = Url.find(params[:id])

  erb :url_discuss
end


#I am adding a post to update the comments table when a new comment is made in the discussion page
