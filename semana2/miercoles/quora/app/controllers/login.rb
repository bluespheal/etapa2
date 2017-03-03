get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:user_email])
  session[:user_id] = "#{@user.id}"
  if User.authenticate(params[:user_email], params[:user_password])
    redirect to("/users/#{@user.id}")
  else
    erb :login
  end
end