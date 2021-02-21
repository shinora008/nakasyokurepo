class ChangeDatatypeEvaluationOfreports < ActiveRecord::Migration[6.0]
  def up
    change_column :reports, :evaluation, :float, null: true
  end

  def down
    change_column :reports, :evaluation, :float, null: false
  end
end
