get '/update_info' do
  erb :update_info
end

post '/update_info' do
  user = current_user

  if current_user.username == params[:current_username] && params[:new_username]
    user.assign_attributes({ :username => params[:new_username] })
  end

  if current_user.email == params[:current_email] && params[:new_email]
    user.assign_attributes({ :email => params[:new_email] })
  end

  if current_user.password == params[:current_password] && params[:new_password]
    user.assign_attributes({ :password => params[:new_password] })
  end

  if user.save
    redirect to '/'
  else
    erb :update_info
  end
end