def current_user
  if session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end
end

def logged_in?
  !current_user.nil?
end

def oauth_consumer
  raise RuntimeError, "Debes configurar una TWITTER_KEY y TWITTER_SECRET en tu yaml file y environment." unless ENV['TWITTER_KEY'] and ENV['TWITTER_SECRET']
  @consumer ||= OAuth::Consumer.new(
    ENV['TWITTER_KEY'],
    ENV['TWITTER_SECRET'],
    :site => "https://api.twitter.com"
  )
end

def host_and_port
    # En este método creamos la base de nuestra 'calback url' de la app 
    # para funcionar tanto local como en producción 
    # Esta línea toma de una variable de la petición (creada por sinatra) la url.  
    host_and_port = request.host
    # Si estamos desarrollando localmente necesitamos agregar el puerto 
    host_and_port << ":#{request.port}" if request.host == "localhost"
    host_and_port
end

def job_is_complete(jid)
  # Revisa si la tarea se encuentra pendiente
  pending = Sidekiq::ScheduledSet.new
  return false if pending.find { |job| job.jid == jid }
  # Revisa si la tarea se encuentra en la cola 
  waiting = Sidekiq::Queue.new 
  return false if waiting.find { |job| job.jid == jid }
  # Revisa si la tarea se encuentra en proceso 
  working = Sidekiq::Workers.new
  return false if working.find { |worker, info| info["payload"]["jid"] == jid }
  # Si no se cumplió ninguna de las anteriores entonces la tarea ya fue procesada.  
  true
end


def request_token

  unless session[:request_token]

    # A una instancia de OAuth::Consumer llamamos el método get_request_token
    # Esto hace una petición http a la API de Twitter mandando como argumento la 'calback url' y las 'consumer keys'
    # La petición nos regresa un 'request_token' 
    # Este token contiene una url donde se llevará acabo la autenticación del usuario 
    # Esta url la guardamos en la sesión para no perderla. 
    session[:request_token] = oauth_consumer.get_request_token(
      :oauth_callback => "http://#{host_and_port}/auth"
    )
  end
  session[:request_token]
end