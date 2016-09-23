require_relative '../models/quote'

Quote.new("I spent my money on fast cars and fast women. The rest I squandered.", "George Best")
Quote.new("I enjoy deadlines. I love the whooshing sound they make as they go flying by.", "Douglas Adams")

# index
get "/quotes" do
  @quotes = Quote.all
  erb :"quotes/index"
end

# create
post "/quotes" do
  quote = params[:quote]
  Quote.new(quote[:text], quote[:author])
  redirect "/quotes"
end

# new
get "/quotes/new" do
  erb :"quotes/new"
end

# show
get "/quotes/:id" do
  @quote = Quote.find_by_id(params[:id])
  erb :"quotes/show"
end

# edit
get "/quotes/:id/edit" do
  @quote = Quote.find_by_id(params[:id])
  erb :"quotes/edit"
end

# update
put "/quotes/:id" do
  quote = Quote.update_by_id(params[:id], params[:quote])
  redirect "/quotes/#{quote.id}"
end

# delete
delete "/quotes/:id" do
  Quote.delete_by_id(params[:id])
  redirect "/quotes"
end