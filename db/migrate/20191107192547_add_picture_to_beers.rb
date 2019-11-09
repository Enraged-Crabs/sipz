class AddPictureToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :picture, :string
  end
end
