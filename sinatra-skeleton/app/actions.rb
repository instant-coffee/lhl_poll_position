# Homepage (Root path)
require "sinatra/json"

get '/' do
  erb :index
end

# # # Student Pages # # #
get '/submit' do
  erb:'user/submit'
end

get '/vote' do
  @ideas = Idea.all
  erb:'user/vote'
end

get '/about' do
  erb:'about'
end

post '/cast' do
  # @test = params[:votes].class
  # binding.pry
  # puts @test 
  # .each do|key, val| 
  #  val.class
 # end
 params[:votes].each do |key, val|
   idea =  Idea.find(key.to_sym)
   if val == "on"
    idea.votes += 1
    idea.save
  end
  erb:'user/cast'
end
end

# # # Admin Pages # # #
get '/admin/ideas' do
  @ideas = Idea.all
  erb:'admin/manage_ideas'
end

get '/admin/groups' do
  @ideas = Idea.all
  erb:'admin/manage_groups'
end



# Add idea to Ideas Table
post '/ideas' do

  @idea = Idea.new(
    author: params[:author],
    title: params[:title],
    description: params[:description]
    )

  if @idea.save
    json @idea
  end
end

# Add student to Students table
post '/students' do

  @student = Student.new(
    name: params[:author]
    )

  if @student.save
    json @student
  end
end

# # # Admin: Manage ideas # # #
#Retrieve idea to edit
get '/edit_idea/:id' do
  @idea = Idea.find(params[:id])
  erb:'admin/edit_idea'
end

# Update idea after edit
post '/update_idea/:id' do
  idea = Idea.find(params[:id])
  idea.title = params[:title]
  idea.description = params[:description]
  idea.save

  redirect 'admin/ideas'
end

# Toggle True/False for inclusion in final Ideas list
get '/add_final/:id' do
 idea = Idea.find(params[:id])
 if idea.final == false
  idea.final = true
  idea.save
 else
  idea.final = false
  idea.save
 end

 redirect 'admin/ideas'
end

# Delete idea from list
get '/delete_idea/:id' do
  Idea.find(params[:id]).destroy

  redirect 'admin/ideas'
end






