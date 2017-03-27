


get '/questions/new' do
  #binding.pry
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])

  erb :question
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/edit'
end



get '/questions/:id/comments/new' do
  erb :'questions/:id/comments/new'
end




post '/questions' do
  #post a new question
  #binding.pry

  question =  current_user_id.questions.new(params[:question])


  if question.save
    redirect "/questions/#{question.id}"
  else
    @errors = question.errors.full_messages
    erb :'/questions/new'
  end
end

post '/questions/:id/answers' do
#answer a question
  #binding.pry
  answer = current_user_id.answers.new(params[:answer])
  #binding.pry
  if request.xhr?
    if answer.save
      erb :'partial/_post', layout: false, locals: {post: answer, post_type: "answer".to_sym, question_id: answer.question_id}
    else
      erb :'partial/_errors',layout: false, locals: {errors: answer.errors.full_messages}
    end
  else
    if answer.save
      redirect "/questions/#{question.id}"
    else
      @errors = answer.errors.full_messages
      erb :questions
    end
  end

end



post '/questions/comments' do


  comment=current_user_id.comments.new(params[:comment])

  if request.xhr?
    if comment.save
      erb :'partial/_comment',layout: false, locals: {comment: comment}
    else
      erb :'partial/_errors', layout: false, locals: {errors: comment.errors.full_messages}
    end
  else
    if comment.save
      redirect "/questions/#{params[:comment][:commentable_id]}"
    else
      @errors = comment.errors.full_messages
      erb :questions
    end
  end
end



post '/questions/:id/comments' do
  comment=current_user_id.comments.new(params[:comment])

  if request.xhr?
    if comment.save
      erb :'partial/_comment',layout: false, locals: {comment: comment}
    else
      erb :'partial/_errors', layout: false, locals: {errors: comment.errors.full_messages}
    end
  else
    if comment.save
      redirect "/questions/#{params[:comment][:commentable_id]}"
    else
      @errors = comment.errors.full_messages
      erb :questions
    end
  end
end

put '/questions/:id' do
  #binding.pry
  @question = Question.find_by(id: params[:id])
  if @question.update(params[:question])
    erb :'question'
  else
    @errors = @question.errors.full_messages
    erb :'/questions/:id/edit'
  end
end

delete '/questions/:id' do
  #binding.pry
  @question = Question.find_by(id: params[:id])

  @question.destroy
  redirect '/'
end
