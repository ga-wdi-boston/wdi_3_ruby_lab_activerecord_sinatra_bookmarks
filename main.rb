require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'


set :server, 'webrick'

# Begin Helper Methods
def run_sql(sql)
# boiler plate
  db = PG.connect(dbname: 'address_book', host: 'localhost')
  result = db.exec(sql)
  db.close
  result
end

# DB app
get '/people' do
  @people = run_sql('SELECT * FROM people')
  erb :people
end

post '/people' do
  name, phone = params[:name], params[:phone]
  run_sql("INSERT INTO people (name, phone) VALUES ('#{name.capitalize}', '#{phone}')")
  redirect to '/people'
end

post '/people/delete' do
  name = params[:name]
  run_sql("DELETE FROM people WHERE name = '#{name.capitalize}'")
  redirect to '/people'
end
