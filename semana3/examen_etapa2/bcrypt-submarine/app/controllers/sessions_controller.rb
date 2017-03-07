# GETS ============================================

get '/signin' do
	erb :signin
end

get '/logout' do
  if logged_in?
    session.clear
    redirect to ("/")
  else
    redirect to ("/")
  end
end

# POSTS ============================================

post '/signin' do
  @user = Jugador.find_by(email: params[:user_email])
  session[:jugador_id] = "#{@user.id}"
  if @user.authenticate(params[:user_email], params[:user_password])
    redirect to("/secret")
  else
    erb :signin
  end

end
