class AddServiceToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :service, :string
  end
end
