class AddFieldsToUserTable < ActiveRecord::Migration[5.2]
  def change

    add_column :users, :moderator, :boolean
    add_column :users, :brewery, :boolean, default: false
    add_column :users, :location, :string
    add_column :users, :username, :string
  end
end
