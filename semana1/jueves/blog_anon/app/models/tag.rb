class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :postags
  has_many :posts, through: :postags

  validates :tag, :presence => true, uniqueness: true
end
