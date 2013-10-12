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

# Gets all links and displays them on the index page. 
get '/shortlinks' do
	@links = Link.all
	erb :link_index
end

# Gets one link's info and goes to the view/discuss page. 
get '/shortlinks/:id' do
	@link = Link.find(params[:id])
	erb :link_solo
end

#link_solo.erb cancel comment and redirect to link_index.erb. just use the '/shortlinks' method.
# get
# end

#link_index.erb shorten link via submit button, redirects to link_index.erb
post '/shortlinks/shorten' do
	#???
	redirect '/shortlinks'
end

#link_solo.erb submit comment and redirect to link_index.erb
post 'shortlinks/comment' do
	Comment.create(params[:id], author: params[:author], body: params[:body])
	redirect '/shortlinks'
end






