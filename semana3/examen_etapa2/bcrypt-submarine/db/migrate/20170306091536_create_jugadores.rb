class CreateJugadores < ActiveRecord::Migration
  def change
    create_table :jugadors do |t|
      t.string :username
      t.string :email
      t.string :password
      t.decimal :games_won

      t.timestamps
    end

    create_table :juegos do |t|
      t.belongs_to :jugador, index: true
      t.decimal :destroyed_subs

      t.timestamps
    end
  end
end
