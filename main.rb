require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'rake'

set :database, {adapter: 'postgresql', database: 'shortlinks', host: 'localhost'}

class Link < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :link
end

# def up
# 	create_table :links do |t|
# 	t.text :url
# 	t.text :short_url
# 	t.timestamp :created_at
# end

get '/shortlinks' do
	@links = Link.all
	erb :link_index
end

get '/shortlinks.new' do
	erb :link_new
end
