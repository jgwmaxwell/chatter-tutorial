class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :content

      t.timestamps
    end

    create_table :posts_tags do |t|
      t.integer :post_id
      t.integer :tag_id
    end

    add_index :tags, :content, :unique => true
    add_index :posts_tags, :post_id
    add_index :posts_tags, :tag_id
  end
end
