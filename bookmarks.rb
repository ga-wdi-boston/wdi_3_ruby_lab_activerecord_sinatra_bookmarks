require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'

def run_sql(sql)
	db = PG.connect(dbname: 'websites', host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/becky' do
  	erb :becky_hello
end

get '/tom'  do
	 "hey tom how are you?"
end

get '/websites' do
  @websites = run_sql("SELECT * FROM bookmarks")
	erb :websites
end

post '/websites' do
	url = params[:url]
	binding.pry
	run_sql("INSERT INTO bookmarks (url) VALUES ('#{url}')")
	redirect to '/websites'
end