class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :caption
      t.integer :user_id
      t.integer :beer_id
      t.timestamps
    end
    add_index :posts, [:user_id, :beer_id]
    add_index :posts, :beer_id
  end
end
