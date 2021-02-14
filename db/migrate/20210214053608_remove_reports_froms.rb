class RemoveReportsFroms < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :shop_id, :integer
  end
end
