class Tags < ActiveRecord::Base
  # Remember to create a migration!
  validates :body, :presence => true, uniqueness: true

end
