class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end

    add_index :mentions, :post_id
    add_index :mentions, :user_id
  end
end
