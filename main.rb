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

get '/index' do

  erb :url_index
end

get '/index/new' do
  
  erb :url_new
end

get '/index/discuss' do
  @urls = Url.all
binding.pry
  erb :url_discuss
end

get '/index/:id' do
    @url = Url.find(params[:id])
end

post 'index/create' do
  #where the hard shit will go down
end