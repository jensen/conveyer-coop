class AddImagesToRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.string :extension

      t.references :restaurant

      t.timestamps
    end
  end
end
