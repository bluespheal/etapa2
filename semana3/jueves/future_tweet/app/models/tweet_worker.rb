class TweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)
    tweet = Tweet.find_by(id: tweet_id)
    user  = User.find_by(id: tweet.user_id)

    user.tweet(tweet.tweet)
  end

 
end