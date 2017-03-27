
get '/' do

  @questions = Question.top_25
  erb :index
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    # @errors = @user.errors.full_messages
    erb :'../login'
  end
end

get '/users/login' do
  erb :'users/login'
end
get '/users/signup' do
  erb :'users/signup'
end


post '/users/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    # @errors = @user.errors.full_messages
    erb :'users/login'
  end
end


get '/users/logout' do
  session[:user_id] = nil
  redirect '/users/login'
end
