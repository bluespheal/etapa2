  class User < ActiveRecord::Base
  end

post '/users' do
  # Capturamos los valores del formulario con 'params'
  name  = params[:name]
  email = params[:email]
  # Creamos una instancia de la clase User con sus atributos necesarios
  user  = User.new(name: name, email: email)
  # Si el usuario se guardó en la DB, redirige a su perfil, de otra forma
  # vuelve a mostrar el formulario.
  if user.save
    redirect to("/users/#{user.id}")
  else
    erb :index
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :profile
  end

end