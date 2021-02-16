class AddPictureToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :picture, :string
  end
end
