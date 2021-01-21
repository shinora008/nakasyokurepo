class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :shopname
      t.string :shopaddress
      t.string :opening_hour

      t.timestamps
    end
  end
end
