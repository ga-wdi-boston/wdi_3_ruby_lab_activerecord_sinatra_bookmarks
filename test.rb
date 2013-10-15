require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'url_short_db',
                host: 'localhost'}

class Url < ActiveRecord::Base
  #learned about these from a screencast tutorial
  validates_uniqueness_of :url
  validates_presence_of :url
  validates_format_of :url, : with => /^\b((?:https?:\/\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))$/

  has_many :comments
end

#for the root path when people visit the site
get '/' do
  
end

#to create our shortened url
post '/' do
  #code for finding or creating short url
  @short_url = ShortenedUrl.find_or_create_by_url(params[:url])
  if @short_url.valid?
     #success
    else
      #redirect to index
  end
end

#forward people from shortened url to destination
get '/:shortened' do
  short_url = ShortenedUrl.find(params[:shortened]) #id
  redirect short_url.url
end