require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'


def run_sql(sql)
	db = PG.connect(dbname: 'bookmarks_data', host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/bookmarks' do
	@urls = run_sql("SELECT * FROM bookmarks")
	erb :bookmarks
end

post '/bookmarks' do
	name, url = params[:name], params[:url]
	run_sql("INSERT INTO bookmarks (name,url) VALUES ('#{name}','#{url}')")
	redirect to '/bookmarks'
end
