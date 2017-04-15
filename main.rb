require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'


set :server, 'webrick'

# Begin Helper Methods
def run_sql(sql)
# boiler plate
  db = PG.connect(dbname: 'bookmarks', host: 'localhost')
  result = db.exec(sql)
  db.close
  result
end

# DB app
get '/bookmarks' do
  @bookmarks = run_sql('SELECT * FROM bookmarks')
  erb :bookmarks
end

post '/bookmarks' do
  name, url = params[:name], params[:url]
  run_sql("INSERT INTO bookmarks (name, url) VALUES ('#{name.capitalize}', '#{url}')")
  redirect to '/bookmarks'
end

post '/bookmarks/delete' do
  name = params[:name]
  run_sql("DELETE FROM bookmarks WHERE name = '#{name.capitalize}'")
  redirect to '/bookmarks'
end
