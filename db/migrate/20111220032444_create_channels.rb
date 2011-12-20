class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :broadcastable_id
      t.string :broadcastable_type
      t.string :channel_ident
      t.datetime :last_validated

      t.timestamps
    end

    add_index :channels, [:broadcastable_id, :broadcastable_type]
  end
end
