require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

# Structure:
# "bookmarks_db" is the database in sql
#  "bookmarks" is the name of the table
#   @bookmarks is the ruby object that holds the table from the database as an array

DBNAME = "bookmarks_db"

def run_sql(sql)
	db = PG.connect(dbname: DBNAME , host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end


get '/bookmarks' do
	@bookmarks = run_sql("SELECT * FROM bookmarks")
	erb :bookmarks
end

post '/bookmarks' do
	# these need to come in from a form submission
	name, url = params[:name], params[:url]
	run_sql("INSERT INTO bookmarks (name, url) VALUES ('#{name}', '#{url}')")
	redirect to ('/bookmarks')
end