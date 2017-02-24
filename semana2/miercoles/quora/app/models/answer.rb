class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :answer, presence: true

end
