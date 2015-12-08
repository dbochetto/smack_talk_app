class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :smack_id
      t.integer :user_id
      t.integer :response_id

      t.timestamps

    end
  end
end
