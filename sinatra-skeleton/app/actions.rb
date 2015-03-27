# Homepage (Root path)
require "sinatra/json"

get '/' do
  erb :index
end

get '/dashboard' do
  erb:'forms/dashboard'
end

post '/dashboard' do
  title = params[:title]
  description = params[:description]

  @idea = Idea.new(
    title: params[:title],
    description: params[:description]
    )

  if @idea.save
    json @idea
  end
  # if @idea.save
  #   redirect '/'
  # else
  #   erb:'forms/dashboard'
  # end
end

post '/vote' do
  
end
