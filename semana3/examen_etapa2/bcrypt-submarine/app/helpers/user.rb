helpers do
  def current_user
    if session[:jugador_id]
      @current_user ||= Jugador.find_by_id(session[:jugador_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end
end

