require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'url_short_db',
                host: 'localhost'}

get '/index' do
  
  erb: url_index
end

get '/index/new' do
  
  erb: url_new
end

get '/index/discuss' do
  
  erb: url_discuss
end

get '/index/:id' do
  
end

post 'index/create' do
end