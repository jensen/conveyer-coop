class AddForeignKeyToExistingTables < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :stores, :restaurants
    add_foreign_key :stores, :cities

    add_foreign_key :culinary_styles, :restaurants
    add_foreign_key :culinary_styles, :cuisines
  end
end
