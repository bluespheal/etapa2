class User < ActiveRecord::Base
  has_many :tweets

  validates :username, :oauth_token, :oauth_token_secret, presence: true
  validates :username, uniqueness: true

  def tweet(tweet)
    $client.access_token = self.oauth_token
    $client.access_token_secret = self.oauth_token_secret
    $client.update(tweet)
  end

  def tweet_later(text)
    tweet = self.tweets.create(tweet: text)
    thiswork = TweetWorker.perform_async(tweet.id)
  end


end
