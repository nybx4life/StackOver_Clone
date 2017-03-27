
get '/users/:id' do
  @user = User.find(params[:id])
  @questions_answers = @user.questions_answers.sort { |x,y| y.votes.count <=> x.votes.count}
  @questions = @questions_answers.select { |question| question.class == Question}
  @answers = @questions_answers - @questions
  erb :'users/show'
end
