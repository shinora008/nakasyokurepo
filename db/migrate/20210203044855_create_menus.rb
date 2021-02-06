# frozen_string_literal: true

class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :dish_name
      t.integer :price
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
