require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
				database: 'url-shortener',
				host: 'localhost'}

class Link < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :link
end

get '/shortlink/' do
  @links = Link.all
  erb :index
end

post '/shortlink/shorten' do
  short_url = (0...5).map{ ('a'..'z').to_a[rand(26)] }.join
  Link.create(url: params[:url], short_url: short_url)
  redirect '/shortlink/'
end

get '/shortlink/discuss/:short_url' do
  @link = Link.where(short_url = params[:short_url])
  erb :discuss
end

get '/shortlink/:short_url' do
  link = Link.where(short_url = params[:short_url])
  redirect "link.url"
end


