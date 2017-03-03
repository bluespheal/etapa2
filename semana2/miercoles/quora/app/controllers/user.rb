get '/users/:id' do
  @user_profile = User.find(params[:id])
  erb :profile
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

get '/show_all_users' do
  @users = User.all
  erb :show_all_users
end