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