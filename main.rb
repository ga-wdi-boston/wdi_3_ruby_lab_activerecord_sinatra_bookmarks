require 'sinatra'
require 'sinatra/reloader'
require 'pg'

def run_sequel(sql)
  db = PG.connect(dbname: 'bookmarks', host: 'localhost')
  result = db.exec(sql)
  db.close
  result
end

get '/bookmarks' do
  @bookmarks = run_sequel("SELECT * FROM favorites")
  erb :bookmarks
end

post '/bookmarks' do
  #These need to come in from a form submission
  name, link = params[:name], params[:link]
  run_sequel("INSERT INTO favorites (name, link) VALUES ('#{name}', '#{link}')")
  redirect to '/bookmarks'
end
