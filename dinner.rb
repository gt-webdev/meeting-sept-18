require 'sinatra'

food = ['chocolate', 'tv dinner', 'cereal', 'hot dogs', 'veal', 'pizza']

get '/dinner' do
  dinner
end

get '/add_dinner' do
  <<-FORM
<form action="/add_dinner" method="post">
  dinner: <input type="text" name="dinner">
  <input type="submit">
</form>

#{food}
  FORM
end

post '/add_dinner' do
  food << params[:dinner]
  redirect to('/add_dinner')
end

def dinner
  food[rand(food.size)]
end
