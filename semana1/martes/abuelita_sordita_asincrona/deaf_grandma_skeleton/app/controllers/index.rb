get '/' do
  @abuelita = params[:abuelita]

  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  if params[:user_input] != params[:user_input].upcase
    "HUH?! NO TE ESCUCHO, HIJO!"
  elsif params[:user_input] == "BYE TQM"
    "ADIOS MIJO :V"
  else
    "NO, NO DESDE 1983"
  end
end