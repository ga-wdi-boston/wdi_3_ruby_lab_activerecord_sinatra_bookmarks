require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

def run_sql(sql)
	db = PG.connect(dbname: 'bookmarks', host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/bookmarks' do
	@bookmarks = run_sql("SELECT * FROM bookmarks")
	erb :bookmarks
end

post '/bookmarks' do
	name, address = params[:name], params[:address]
	run_sql("INSERT INTO bookmarks (name, address) VALUES ('#{name}', '#{address}')")
	redirect to '/bookmarks'
end
