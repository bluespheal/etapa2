enable :sessions

get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @online = session[:session]
  erb :index
end

get '/crear_cuenta' do
  erb :create
end

post '/crear_cuenta' do
  @name = params[:user_name]
  @email = params[:user_email]
  @password = params[:user_password]
  @add = User.new(name: @name, email: @email, password: @password)
  if @add.save
    puts "Se añadio el usuario con éxito!"
    redirect to ("/")
  else
    puts "NO Se añadio el usuario con éxito!!!! >:V"
    erb :create
  end
end

get '/login' do
  erb :login
end

before do
  


end

post '/login' do
  @email = params[:user_email]
  @password = params[:user_password]
  if User.authenticate(@email, @password)
    session[:session] = "#{@email}"
    redirect to ("/")
  else
    erb :login
  end
end

get '/cerrar_sesion' do
  if session[:session] 
    session.clear
    redirect to ("/")
  else
    redirect to ("/")
  end
end


get '/secreto' do
  if session[:session] 
    @online = session[:session]
    erb :secret
  else
    erb :no_secret_4_U
  end

end
