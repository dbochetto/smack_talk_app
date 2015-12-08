class CreateSmacks < ActiveRecord::Migration
  def change
    create_table :smacks do |t|
      t.string :title
      t.text :body
      t.string :image
      t.string :video
      t.integer :league_id
      t.integer :user_id

      t.timestamps

    end
  end
end
