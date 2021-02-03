class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :comment
      t.references :user, foreign_key: true
      t.references :shop,  foreign_key: true
      t.references :report, foreign_key: true
      t.timestamps
    end
  end
end
