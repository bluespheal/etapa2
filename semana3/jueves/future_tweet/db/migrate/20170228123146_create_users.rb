class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :oauth_token
      t.string :oauth_token_secret
      
      t.timestamps
    end

    create_table :tweets do |t|
      t.belongs_to :user, index: true
      t.string :tweet

      t.timestamps
    end

  end
end
