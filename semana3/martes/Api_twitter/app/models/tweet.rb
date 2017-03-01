class Tweet < ActiveRecord::Base

  validates :tweet, presence: true
  validates :tweet, uniqueness: true

end
