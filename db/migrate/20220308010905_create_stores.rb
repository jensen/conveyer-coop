class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :address
      t.string :postal_code

      t.belongs_to :restaurant
      t.belongs_to :city

      t.timestamps
    end
  end
end
