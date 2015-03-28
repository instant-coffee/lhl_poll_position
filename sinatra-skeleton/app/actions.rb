# Homepage (Root path)
require "sinatra/json"

get '/' do
  erb :index
end

get '/submit' do
  erb:'user/submit'
end

get '/admin' do
  erb:'admin/manage_ideas'
end

get '/vote' do
  @ideas = Idea.all
  erb:'user/vote'
end

post '/submit' do
  title = params[:title]
  description = params[:description]
  
  # @student = Student.new(
  #   name: params[:author]
  #   )

  @idea = Idea.new(
    author: params[:author],
    title: params[:title],
    description: params[:description]
    )

  if @idea.save
    json @idea
    # json @student
  end
end

