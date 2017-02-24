enable :sessions

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:user_email])
  session[:user_id] = "#{@user.id}"
  if User.authenticate(params[:user_email], params[:user_password])
    redirect to("/users/#{@user.id}")
  else
    erb :login
  end
end

get '/logout' do 
  if logged_in?
    session.clear
    redirect to ("/")
  else
    redirect to ("/")
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
end

get '/register_account' do
  erb :register_account
end

post '/create_account' do
  create
end

get '/ask_question' do 
  erb :ask_question
end

post '/ask_question' do 
  question = params[:question]
  puts "user #{current_user.username} asked #{question}" 
end

get '/answer_question' do

end

get '/show_user_questions' do

end

get '/show_user_answers' do

end

get '/show_all_questions' do

end

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


get '/show_all_users' do
  @users = User.all
  erb :show_all_users
end

def create
    @user = User.new(params[:user])
    @user.username = params[:username]
    @user.email = params[:user_email]
    @user.password = params[:user_password]
    if user.save!
      redirect to("/#{@user.id}")
    else
      erb :register_account
    end
end