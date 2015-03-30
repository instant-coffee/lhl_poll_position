# Homepage (Root path)
require "sinatra/json"
require_relative 'admin_actions'
require_relative 'student_actions'

get '/' do
  erb :index
end

# # # Student Pages # # #
get '/student/submit' do
  erb:'student/submit'
end

get '/student/vote' do
  @ideas = Idea.all
  erb:'student/vote'
end

get '/student/results' do
  @ideas = Idea.where("votes > '0'")
  erb:'student/results'
end

# # # Admin Pages # # #
get '/admin/ideas' do
  @ideas = Idea.all
  erb:'admin/manage_ideas'
end

#Retrieve idea to edit
get '/update_idea/:id' do
  @idea = Idea.find(params[:id])
  erb:'admin/update_idea'
end

get '/admin/manage_groups' do
  @ideas = Idea.where("votes > 0").order(votes: :desc)
  @students = Student.all
  erb:'admin/manage_groups'
end

get '/admin/groups' do
  @ideas = Idea.where("votes > 0").order(votes: :desc).limit(6)
  @students = Student.all
erb:'/admin/final_groups'
end

get '/whoareyou' do
  erb:'whoareyou'
end

get '/about' do
  erb:'about'
end

get '/admin/final' do
  @ideas = Idea.where("votes > 0").order(votes: :desc)
  @students = Student.all
  erb:'admin/final'
end

