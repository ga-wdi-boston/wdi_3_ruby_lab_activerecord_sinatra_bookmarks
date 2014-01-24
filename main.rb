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
	@bookmarks = run_sql("SELECT * FROM bookmarks") # this is a hash, i think? not sure
	erb :bookmarks
end

# post '/bookmarks' do
# 	# these need to come in from a form submission
# 	name, phone = params[:name], params[:phone]
# 	run_sql("INSERT INTO people (name, phone) VALUES ('#{name}', '#{phone}')")
# 	redirect to '/people'
# end
