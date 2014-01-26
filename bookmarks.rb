require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

set :server, 'webrick'

def run_sql(sql)
	db = PG.connect(dbname: 'bookmarks', host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/bookmarks' do
	@list = run_sql("SELECT * FROM bookmarks")
	erb :bookmark
end

post '/bookmarks' do
	name, url = params[:name], params[:url]
	run_sql("INSERT INTO bookmarks (name, url) VALUES ('#{name}', '#{url}')")
	redirect to '/bookmarks'
end

post '/bookmarks/del' do
	name, url = params[:name], params[:url]
	run_sql("DELETE FROM bookmarks WHERE name = '#{name}' AND url = '#{url}'")
	redirect to '/bookmarks'
end