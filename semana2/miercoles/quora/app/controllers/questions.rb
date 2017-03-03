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

get '/show_all_questions' do
  @user_profile = current_user
  @questions = Question.all
  erb :all_questions
end

# Nani people laiku watashis paypeh malio games yanai?!

# (ノ°Д°）ノ︵ ┻━┻