# frozen_string_literal: true

class DropComment < ActiveRecord::Migration[6.0]
  def up
    drop_table :comments
  end

  def down
    create_teble :comments do |t|
      t.string :title
      t.text :comment
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.references :report, foreign_key: true
      t.timestamps
    end
  end
end
