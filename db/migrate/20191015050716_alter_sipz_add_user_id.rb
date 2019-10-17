class AlterSipzAddUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :sips, :user_id, :integer
    add_index :sips, :user_id
  end
end
