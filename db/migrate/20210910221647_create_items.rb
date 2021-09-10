class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :manufacturer
      t.string :model
      t.string :serial_number

      t.timestamps
    end
  end
end
