class User < ActiveRecord::Base
  has_many :tweets

  validates :username, :oauth_token, :oauth_token_secret, presence: true
  validates :username, uniqueness: true

end
