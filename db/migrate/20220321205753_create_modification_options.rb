class CreateModificationOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :modification_options do |t|
      t.string :name
      t.integer :price
      t.boolean :multiple
      t.references :modification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
