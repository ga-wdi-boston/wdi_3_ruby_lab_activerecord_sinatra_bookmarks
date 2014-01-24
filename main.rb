require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoo_finance'
require 'dotenv'
require 'twitter'
require 'pg'

Dotenv.load

set :server, 'webrick'

def run_sql(sql)
	db = PG.connect(dbname: 'url_bookmark', host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/url' do
	@url = run_sql("select * from url")
	erb :url
end

post '/url' do
	url = params[:url]
	run_sql("Insert into url(urls) Values ('#{url}')")
	redirect to '/url'
end
