get '/register_account' do
  erb :register_account
end

post '/create_account' do
  create
end

def create
    @user = User.new(params[:user])
    @user.username = params[:username]
    @user.email = params[:user_email]
    if params[:user_password] == params[:confirm_user_password]
    @user.password = params[:user_password]
    end

    if @user.save!
      @user = User.find_by(email: params[:user_email])
      session[:user_id] = "#{@user.id}"
      redirect to("/users/#{@user.id}")
    else
      erb :register_account
    end
end