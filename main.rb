require "sinatra"
require "sinatra/reloader" if development?

require_relative "./controllers/quotes"

get "/" do 
  redirect "/quotes"
end