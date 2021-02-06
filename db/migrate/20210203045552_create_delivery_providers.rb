# frozen_string_literal: true

class CreateDeliveryProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_providers do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
