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
  @user_profile = User.find(params[:id])
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
  @question = current_user.questions.create(question: params[:question])

  if @question.save
    redirect  to "/users/#{current_user.id}"
  else
    erb :ask_question
  end

end

get '/answer_question' do
  @user_profile = current_user
  @questions = Question.where.not(user_id: @user_profile.id)
  erb :answer
end

get '/answer_question/:id' do 
  @question_id = Question.find(params[:id])
  @one_question = Question.find_by(id: @question_id.id )

  erb :answer_one
end

post '/answer_question/:id' do 
  @question_id = Question.find(params[:id])

  @answer = current_user.answers.create(question_id: @question_id.id, answer: params[:answer])

  if @answer.save
    redirect  to "/users/#{current_user.id}"
  else
    erb :answer_one
  end

end

get '/show_user_questions/:id' do
  @user_profile = User.find(params[:id])
  @questions = Question.where(user_id: @user_profile.id)
  erb :show_user_questions
end

get '/show_user_answers/:id' do
  @user_profile = User.find(params[:id])
  @answers = Answer.where(user_id: @user_profile.id)
  erb :all_user_answers
end

get '/show_all_questions' do
  @user_profile = current_user
  @questions = Question.all
  erb :all_questions
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