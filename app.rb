require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

def run_sql(sql)
  db = PG.connect(dbname: 'bookmarker', host: 'localhost')
  result = db.exec(sql)
  db.close
  result
end

get '/links' do
  @links = run_sql("SELECT * FROM links")
  erb :links
end

post '/links' do
  title, url, category, interest, recently_updated = params[:title], params[:url], params[:category], params[:interest], params[:recently_updated]
  run_sql("INSERT INTO links (title, url, category, interest, recently_updated) VALUES ('#{title}','#{url}','#{category}','#{interest}','#{recently_updated}')")
  redirect to '/links'
end
