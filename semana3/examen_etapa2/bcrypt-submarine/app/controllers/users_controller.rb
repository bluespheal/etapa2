# GETS ============================================

get '/signup' do
	erb :signup
end


# POSTS ============================================

post '/signup' do
  @user = Jugador.new(params[:jugador])
  @user.username = params[:username]
  @user.email = params[:user_email]
  @user.password = params[:user_password]
  @user.games_won = 0


  if @user.save!
    @user = Jugador.find_by(email: params[:user_email])
    session[:jugador_id] = "#{@user.id}"
    redirect to("/secret")
  else
    erb :signup
  end
end