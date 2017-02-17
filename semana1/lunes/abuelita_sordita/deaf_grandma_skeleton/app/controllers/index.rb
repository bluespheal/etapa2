get '/' do
  @abuelita = params[:abuelita]

  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  @user_input = params[:user_input]
  if @user_input
    redirect to ("/?abuelita=#{sorda(@user_input)}")
  # else
  #   erb :index
  end
end

def sorda(string)
  if string != string.upcase
    "HUH?! NO TE ESCUCHO, HIJO!"
  elsif string == "BYE TQM"
    "ADIOS MIJO :V"
  else
    "NO, NO DESDE 1983"
  end
end

