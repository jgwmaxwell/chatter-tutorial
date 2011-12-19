class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body
      t.integer :user_id
      t.integer :reply_to_id
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :country

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :reply_to_id
    add_index :posts, :city
    add_index :posts, :country
  end
end
