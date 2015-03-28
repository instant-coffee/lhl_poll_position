# Homepage (Root path)
require "sinatra/json"

get '/' do
  erb :index
end

get '/submit' do
  erb:'submit'
end

get '/vote' do
  erb:'/vote'
end

get '/admin' do
  erb:'/admin'
end

post '/submit' do
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

