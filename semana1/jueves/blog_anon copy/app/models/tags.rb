class Tags < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts_tags
  has_many :posts, through: :posts_tags

  validates :tag, :presence => true, uniqueness: true
end
