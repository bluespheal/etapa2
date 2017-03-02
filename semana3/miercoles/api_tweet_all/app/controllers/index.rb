enable :sessions

get '/' do
  erb :index
end

post '/fetch' do 
  tw_hn = params[:handle]
  redirect to "/fetch/#{tw_hn}"
end

get '/fetch/:handle' do 
  p "Why is this happening?!"
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
  $client.update(tweet)
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
  session[:user_id]

end

  # Para el signout no olvides borrar el hash de session
