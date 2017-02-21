class PostsTags < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :posts
  belongs_to :tags

  validates :post, presence: true
  validates :tag, presence: true
end

# posts.tags.create(tag_attribute: value)
# programmer.projects.create(client: client_object). 