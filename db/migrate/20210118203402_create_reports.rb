# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :dish_name
      t.string :service
      t.integer :price
      t.references :user, type: :bigint, foreign_key: true
      t.references :shop, nil: false, foreign_key: true
      t.timestamps
    end
  end
end
