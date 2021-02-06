# frozen_string_literal: true

class AddReferencesToReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :menu, nil: :false, foreign_key: true
    add_reference :reports, :delivery_providers, nil: :false, foreign_key: true
  end
end
