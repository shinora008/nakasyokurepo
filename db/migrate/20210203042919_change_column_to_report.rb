class ChangeColumnToReport < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :service, :string
    remove_column :reports, :price, :integer
    add_column :reports, :title, :string
    add_column :reports, :comment, :text
  end
end
