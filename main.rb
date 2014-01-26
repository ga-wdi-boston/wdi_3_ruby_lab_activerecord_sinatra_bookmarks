require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

def run_sql(sql)
  db = PG.connect(dbname: 'bookmarks', host: 'localhost')
  result = db.exec(sql)
  db.close
  result
end

def get_categories
  run_sql("SELECT category FROM bookmarks")
end

get '/' do
  redirect to '/bookmarks'
end

get '/bookmarks' do
  @categories = get_categories.values.flatten.uniq # Array of categories
  @bookmarks = run_sql("SELECT * FROM bookmarks")
  erb :bookmarks
end

post '/bookmarks' do
  name, url = params[:name], params[:url]
  category = params[:category].empty? && "Uncategorized" || params[:category]
  run_sql("INSERT INTO bookmarks (name, url, category) VALUES ('#{name}', '#{url}', '#{category}')")
  redirect to '/bookmarks'
end
