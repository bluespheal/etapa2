get '/logout' do 
  if logged_in?
    session.clear
    redirect to ("/")
  else
    redirect to ("/")
  end
end