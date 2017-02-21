class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :postags
  has_many :tags, through: :postags

  validates :body, :presence => true
  validates :title, :presence => true
end
