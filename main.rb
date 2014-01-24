require 'sinatra'
require 'sinatra/reloader'
require 'pg'

# This helps us run our sql commands
def run_sql(sql)
	db = PG.connect(dbname: 'bookmarks', host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/bookmarks' do
	@title = 'bookarks'
	@bookmarks = run_sql("SELECT * FROM bookmarks ORDER BY id DESC")
	erb :bookmarks
end

post '/bookmarks' do
	category, url = params[:category], params[:url]
	run_sql("INSERT INTO bookmarks (category, url) VALUES ('#{category}', '#{url}')")
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
