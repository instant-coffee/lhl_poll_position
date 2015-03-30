# Add student to Students table
post '/student_name' do
  @student = Student.new(
    name: params[:author]
    )
  if @student.save
    json @student
  end
end

# Add idea to Ideas Table
post '/submit_idea' do
  @idea = Idea.new(
    author: params[:author],
    title: params[:title],
    description: params[:description]
    )
  if @idea.save
    json @idea
  end
end

# Cast votes
post '/cast' do
 params[:votes].each do |key, val|
   idea =  Idea.find(key)
   if val == "on"
    idea.votes += 1
    idea.save
   end
 end
 redirect 'student/results'
end