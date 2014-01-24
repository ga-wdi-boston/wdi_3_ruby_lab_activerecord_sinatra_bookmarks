require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

def run_sql(sql)
	# sets up a connection
	db = PG.connect(dbname: 'bookmarks')
	# pass it an actual sql query
	result = db.exec(sql)
	# close the database
	db.close
	# show the result
	result
end

get '/bookmarks' do
	@bookmarks = run_sql("SELECT * FROM bookmarks") # this is a hash
	erb :bookmarks
end

post '/bookmarks' do
	# these need to come in from a form submission
	name, link = params[:name], params[:link]
	run_sql("INSERT INTO bookmarks (name, link) VALUES ('#{name}', '#{link}')")
	redirect to '/bookmarks'
end
