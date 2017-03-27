
post '/question/:id/vote' do
  @vote = Vote.create(up_down: params[:up_down], voteable_id: params[:id], voteable_type: "Question")
  @question = Question.find(params[:id])
  erb :question
end

post '/question/:id/answers/vote' do
  @vote = Vote.create(up_down: params[:up_down], voteable_id: params[:id], voteable_type: "Answer")
  @question = Answer.find(params[:id])
  erb :question
end

post '/question/:id/comments/vote' do
  @vote = Vote.create(up_down: params[:up_down], voteable_id: params[:id], voteable_type: "Comment")
  @Comment = Comment.find(params[:id])
  erb :question
end
