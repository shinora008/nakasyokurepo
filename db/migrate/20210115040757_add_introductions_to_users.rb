# frozen_string_literal: true

class AddIntroductionsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :introduction, :text
  end
end
