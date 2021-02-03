class ChangeColumnToShop < ActiveRecord::Migration[6.0]
  def change
    rename_column :shops, :shopname, :name
    rename_column :shops, :shopaddress, :address
    remove_column :shops, :service, :string
  end
end
