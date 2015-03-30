# Homepage (Root path)
require "sinatra/json"

get '/admin/manage_ideas_test' do
  @ideas = Idea.where("votes > 0").order(votes: :desc)
  @students = Student.all
  erb:'admin/manage_ideas_test'
end



post '/admin/manage_ideas_test' do
   params.each do |k,v| 
    student= Student.find(k) 
     student.idea_id=v[0] 
     student.save
   end
   redirect '/admin/final_groups'
 
end

get '/admin/final_groups' do
   @ideas = Idea.where("votes > 0").order(votes: :desc).limit(6)

 erb:'admin/final_groups'
end
  
  

get '/' do
  erb :index
end

get '/login' do
  erb :login
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

get '/admin/manage_ideas_test' do
  erb:'admin/manage_ideas_test'
end

