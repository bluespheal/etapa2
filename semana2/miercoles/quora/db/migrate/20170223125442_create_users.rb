class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :questions do |t|
      t.belongs_to :user, index: true
      t.string :question

      t.timestamps
    end

    create_table :answers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :question, index: true
      t.string :answer

      t.timestamps
    end
  end
end
