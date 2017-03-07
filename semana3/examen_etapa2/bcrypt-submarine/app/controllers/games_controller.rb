get '/score/:user_id' do
  @user = current_user
  @rounds = Juego.where(jugador_id: @user.id )
  erb :round
  
end

post '/games' do
  #¿Qué va en esta parte para recibir la información del round actual, el score del jugador, el conteo de las
  #oportunidades de cada jugador, así como la sesión actual?
  if current_user == nil
    redirect to "/"
  end

  skill = params[:skill]
  p skill
  p current_user.games_won
  if skill == "2"
    current_user.update(:games_won => current_user.games_won += 1)
  end
  @juego = current_user.juegos.create(destroyed_subs: skill.to_i)

  #¿Qué va en esta parte para llevar el registro de las puntuaciones por ronda?
  
end

post '/new_game' do
  redirect to "/secret"
end