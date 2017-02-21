class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body

      t.timestamps
    end

    create_table :tags do |t|
      t.string :tag

      t.timestamps
    end

    create_table :posts_tags do |t|
      t.belongs_to :post, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end