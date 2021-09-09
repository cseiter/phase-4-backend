class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.string :condition

      t.timestamps
    end
  end
end
