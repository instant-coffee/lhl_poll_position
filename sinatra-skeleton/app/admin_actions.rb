# # # Admin: Manage Ideas # # #
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

# # # Admin: Manage Groups # # #
post '/admin/manage_groups' do
  params.each do |k,v| 
   student= Student.find(k) 
    student.idea_id=v[0] 
    student.save
  end

  redirect '/admin/final'
end