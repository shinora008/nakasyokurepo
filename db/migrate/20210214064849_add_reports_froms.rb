# frozen_string_literal: true

class AddReportsFroms < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :shop, nil: :false, foreign_key: true
    remove_column :reports, :dish_name, :string
  end
end
