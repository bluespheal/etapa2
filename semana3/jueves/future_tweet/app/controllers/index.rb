enable :sessions

get '/' do
  erb :index
end

post '/fetch' do 
  tw_hn = params[:handle]
  redirect to "/fetch/#{tw_hn}"
end

get '/fetch/:handle' do 
  handle = params[:handle]
  
  @user = User.find_or_create_by(username: handle)
 
  @tweets = $client.user_timeline("#{handle}", count: 10)
  
  @tweets.each do |tweet|
    @twit = @user.tweets.create(tweet: tweet.full_text)
  end

  erb :list
end 

post '/tweet' do
  tweet = params[:tweet]

  current_user.tweet(tweet)
end

post "/tweet_f" do
  tweet = params[:tweet_f]

  current_user.tweet_later(tweet)
end

get '/status/:job_id' do
  job_is_complete(params[:job_id])
end

get '/sign_in' do
  # El método `request_token` es uno de los helpers
  # Esto lleva al usuario a una página de twitter donde sera atentificado con sus credenciales
  redirect request_token.authorize_url(:oauth_callback => "http://#{host_and_port}/auth")
  # Cuando el usuario otorga sus credenciales es redirigido a la callback_url 
  # Dentro de params twitter regresa un 'request_token' llamado 'oauth_verifier'
end

get '/auth' do
  # Volvemos a mandar a twitter el 'request_token' a cambio de un 'access_token' 
  # Este 'access_token' lo utilizaremos para futuras comunicaciones.   
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # Despues de utilizar el 'request token' ya podemos borrarlo, porque no vuelve a servir. 
  session.delete(:request_token)

  # Aquí es donde deberás crear la cuenta del usuario y guardar usando el 'access_token' lo siguiente:
  # nombre, oauth_token y oauth_token_secret
  # No olvides crear su sesión
  @existance = User.exists?(username: @access_token.params[:screen_name])

  @user =  User.new(username: @access_token.params[:screen_name] , oauth_token: @access_token.params[:oauth_token], oauth_token_secret: @access_token.params[:oauth_token_secret])
  
  if @user.save
    session[:user_id] = @user.id
    redirect to "/"
  elsif @existance
    @user = User.find_by(username: @access_token.params[:screen_name])
    session[:user_id] = @user.id
    redirect to "/"
  end

end

get "/sign_out" do
  session.clear
  redirect to "/"
end



  # Para el signout no olvides borrar el hash de session
