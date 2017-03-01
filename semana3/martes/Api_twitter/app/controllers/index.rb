get '/' do
  erb :index
end

post '/fetch' do 
  tw_hn = params[:handle]
  redirect to "/#{tw_hn}"
end

get '/:handle' do 
  handle = params[:handle]
  
  @user = User.find_or_create_by(username: handle)
 
  @tweets = $client.user_timeline("#{handle}", count: 10)
  
  @tweets.each do |tweet|
    @twit = @user.tweets.create(tweet: tweet.full_text)
  end

  erb :list
end 