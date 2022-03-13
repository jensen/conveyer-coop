class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :menu_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
