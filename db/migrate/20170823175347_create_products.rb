class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :link
      t.string :image
      t.string :price

      t.timestamps null: false
    end
  end
end
