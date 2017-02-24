get '/' do
  erb :index
end

post '/login' do
  if User.authenticate(params[:user_email], params[:user_password])
    erb :welcome
  else
    erb :notwelcome
  end
end

get '/register_account' do
  erb :register_account
end

post '/create_account' do
  create
end

def create
    @user = User.new(params[:user])
    @user.email = params[:user_email]
    @user.password = params[:user_password]
    if @user.save!
      redirect to "/"
    else
      erb :register_account
    end
end