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
  erb :url_index
end

get '/index/new' do
  @urls = Url.all
  erb :url_new
end

#i deleted the /discuss path and will be included in/:id
get '/index/:id' do
  url_id = params[:id]
    @url = Url.find(params[:id])
end

post 'index/create' do
  @urls = Url.long_url
#this is my attempt at converting the long url to short url
  @urls.each do |url|


 redirect ''
  end

end