class Posts < ActiveRecord::Base
  # Remember to create a migration!
  validates :body, :presence => true
  validates :title, :presence => true

end
