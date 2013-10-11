require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', database: 'ga-links', host: 'localhost'}

class Link < ActiveRecord::Base
  has_many :discussions
end

class Discussion < ActiveRecord::Base
  belongs_to :link
end

get '/links/' do 
  @links = Link.all
  erb :link_index
end

get '/links/:id' do
  @link = Link.find(params[:id])
  erb :link_discuss
end

post '/links/create' do
  Link.create(long_url: params[:long_url])
  redirect "/links/"
end

