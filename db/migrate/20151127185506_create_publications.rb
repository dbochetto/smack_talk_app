class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :body
      t.integer :league_id
      t.integer :user_id

      t.timestamps

    end
  end
end
