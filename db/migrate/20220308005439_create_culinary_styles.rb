class CreateCulinaryStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :culinary_styles do |t|
      t.belongs_to :restaurant
      t.belongs_to :cuisine
      t.integer :weight

      t.timestamps
    end
  end
end
