class Postag < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :post
  belongs_to :tag

  # validates :post, presence: true
  # validates :tag, presence: true
end
