require 'sinatra'
require 'sinatra/reloader'
require 'pg'

# This helps us run our sql commands
def run_sql(sql, dbname)
	db = PG.connect(dbname: dbname, host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/bookmarks' do
	@bookmarks = run_sql("SELECT * FROM bookmarks ORDER BY id DESC", 'bookmarks')
	erb :bookmarks
end

post '/bookmarks' do
	category, url = params[:category], params[:url]
	run_sql("INSERT INTO bookmarks (category, url) VALUES ('#{category}', '#{url}')", 'bookmarks')
	redirect to '/bookmarks'
end
