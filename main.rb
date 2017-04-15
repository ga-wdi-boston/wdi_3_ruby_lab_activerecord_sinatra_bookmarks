require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

def run_sql(sql)
  db = PG.connect(dbname: 'bookmarks', host: 'localhost')
  result = db.exec(sql)
  db.close
  result
end

get '/bookmark' do
  @bookmark = run_sql("SELECT * FROM bookmark;")
  erb :bookmark
end

post '/bookmark' do
  # these need to come in from a form submission
  site_name, url = params[:site_name], params[:url]
  run_sql("INSERT INTO bookmark (site_name, url) VALUES ('#{site_name}', '#{url}')")
  redirect to '/bookmark'
end
