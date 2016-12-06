class AddDescToProductAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :product_assets, :desc, :text
  end
end
