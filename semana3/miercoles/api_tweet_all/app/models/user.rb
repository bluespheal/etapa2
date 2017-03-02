class User < ActiveRecord::Base
  has_many :tweets

  validates :username, presence: true
  validates :username, uniqueness: true

end
