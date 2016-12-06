class CreateProductAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :product_assets do |t|
      t.string :name
      t.integer :product_id

      t.timestamps
    end
  end
end
