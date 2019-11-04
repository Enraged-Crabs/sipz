class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.integer :beer_id
      t.integer :user_id
      t.string :name
      t.timestamps
    end
      add_index :beers, :user_id
  end
end
