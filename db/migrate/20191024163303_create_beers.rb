class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.integer :beer_id
      t.string :name
      t.timestamps
    end
  end
end
