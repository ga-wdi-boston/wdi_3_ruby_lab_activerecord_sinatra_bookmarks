require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'


#helps run sql commandss
def run_sql(sql)
	db = PG.connect(dbname: 'address_book', host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/bookmarks' do
	@bookmarks = run_sql("SELECT * FROM bookmarks")
	erb :bookmarks
end
