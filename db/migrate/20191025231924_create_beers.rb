class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.text :message
      t.integer :rating
      t.integer :user_id
      t.timestamps
    end
  end
end
