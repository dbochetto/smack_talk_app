class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :body
      t.string :image
      t.string :video
      t.integer :user_id
      t.integer :publication_id
      t.integer :smack_id

      t.timestamps

    end
  end
end
