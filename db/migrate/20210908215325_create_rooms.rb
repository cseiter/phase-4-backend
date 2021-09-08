class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms, id: :uuid do |t|
      t.string :room
      t.timestamps
    end
  end
end
