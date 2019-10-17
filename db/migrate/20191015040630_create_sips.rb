class CreateSips < ActiveRecord::Migration[5.2]
  def change
    create_table :sips do |t|
      t.text :message
      t.timestamps
    end
  end
end
