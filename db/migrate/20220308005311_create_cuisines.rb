class CreateCuisines < ActiveRecord::Migration[7.0]
  def change
    create_table :cuisines do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :cuisines, :slug, unique: true
  end
end
