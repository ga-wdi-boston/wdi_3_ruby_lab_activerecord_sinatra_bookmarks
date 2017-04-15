require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

def run_sql(sql)
	db = PG.connect(dbname: 'url', host: 'localhost')
	result = db.exec(sql)
	db.close
	result
end

get '/url' do

	@url = run_sql("SELECT * FROM url")
	erb :url

end

post '/url' do
	binding.pry
	name, url = params[:name], params[:url]
	run_sql("INSERT INTO url (name, url) VALUES ('#{name}', '#{url}')")
	redirect to '/url'

end

