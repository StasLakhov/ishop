class AddRolesMaskToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :roles_mask, :string
  end
end
