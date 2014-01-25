require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'linkshort',
                host: 'localhost'}
                
class Url < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
end

class Comment < ActiveRecord::Base
  belongs_to :url
end

get '/' do
  @links = Url.all
  erb :index
end

#Load comments page
get '/comments/:id' do
  @link = Url.find(params[:id])
  erb :comments
end

#Delete
get '/delete/:id' do
  Url.find(params[:id]).destroy
  redirect '/'
end

#Forward shortend url
get '/:shorty' do
  redirect "http://#{Url.where(shortened: params[:shorty]).first.link}"
end

#Create new shortened url
post '/create' do
  Url.create(shortened: rand(36**6).to_s(36), link: params[:url])
  redirect '/'
end

#Create new comment
post '/create_comment/:id' do
  Url.find(params[:id]).comments.create(body: params[:body], url_id: params[:id])
  redirect "/comments/#{params[:id]}"
end