class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :delivery
      t.text :address

      t.timestamps
    end
  end
end
