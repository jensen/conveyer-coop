class CreateModifications < ActiveRecord::Migration[7.0]
  def change
    create_table :modifications do |t|
      t.string :name
      t.boolean :required
      t.integer :max_options

      t.timestamps
    end
  end
end
