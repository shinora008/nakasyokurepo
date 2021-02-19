class AddStareToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :evaluation, :float, null: false
  end
end
