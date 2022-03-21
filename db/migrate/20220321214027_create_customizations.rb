class CreateCustomizations < ActiveRecord::Migration[7.0]
  def change
    create_table :customizations do |t|
      t.references :menu_item, null: false, foreign_key: true
      t.references :modification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
