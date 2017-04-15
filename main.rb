require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

# This helps us run our sql commands
def run_sql(sql)
	db = PG.connect(dbname: 'bookmarks', host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/bookmarks' do
	@title = 'bookmarks'
	# Get all categories
	# Iterate over the categories, selecting the url
	# Where the category matches.
	@categories = run_sql("SELECT DISTINCT category FROM bookmarks")

	erb :bookmarks
end

post '/bookmarks' do
	category, url, name = params[:category], params[:url], params[:name]
	run_sql("INSERT INTO bookmarks (category, name, url) VALUES ('#{category}', '#{name}', '#{url}')")
	redirect to '/bookmarks'
end

get '/contacts' do
	@title = 'contacts'
	@contacts = run_sql("SELECT * FROM contact ORDER BY name")
	erb :contacts
end

post '/contacts' do
	name, phone, email = params[:name], params[:phone], params[:email]
	run_sql("INSERT INTO contact (name, phone, email) VALUES ('#{name}', '#{phone}', '#{email}')")
	redirect to '/contacts'
end
