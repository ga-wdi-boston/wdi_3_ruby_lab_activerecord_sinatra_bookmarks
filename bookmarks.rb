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

get '/app' do
	@list = run_sql("SELECT * FROM bookmarks")
	erb :bookmark
end

post '/app' do
	name, url = params[:name], params[:url]
	run_sql("INSERT INTO bookmarks (name, url) VALUES ('#{name}', '#{url}')")
	redirect to '/app'
end

post '/app/del' do
	name, url = params[:name], params[:url]
	run_sql("DELETE FROM bookmarks WHERE name = '#{name}' AND url = '#{url}'")
	redirect to '/app'
end