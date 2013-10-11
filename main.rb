require 'pg'
require 'pry'
require 'rake'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: "postgresql",
								database: "ga-shortner", 
								host: "localhost"}	
class Link < ActiveRecord::Base
	has_many :comments
end	

class Comment < ActiveRecord::Base
	belongs_to :link
end
