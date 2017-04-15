require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'


#helps run sql commandss
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
	#these need to some in from a form submission
	name = params[:name]
	url = params[:url]
	run_sql("INSERT INTO bookmarks (name, url) VALUES ('#{name}','#{url}')")
	redirect to '/bookmarks'
end
