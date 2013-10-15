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
#!_!_!_!_! i will now need to create an input with the name "long_url"b

get '/:id/discuss' do
  @url = Url.find(params[:id])
  erb :url_discuss
end

#i deleted the /discuss path and will be included in /:id
get '/:id' do
 redirect_url = Url.find(params[:id]).long_url

  redirect "http://#{redirect_url}"
end

post '/create' do
  new_id = Url.long_url(long_url: params[:long_url]).id
  new_url = "/#{new_id}"
  Url.update(new_id, new_url: new_url)

 redirect '/'
end

post '/:id/discuss/delete_comment' do
  redirect_id = Comment.find(params[:id]).url_id
  Comment.find(params[:id]).destroy
  redirect "/#{redirect_id}/discuss"
end

post '/:id/delete' do
  Url.find(params[:id]).destroy
  redirect '/'
end
