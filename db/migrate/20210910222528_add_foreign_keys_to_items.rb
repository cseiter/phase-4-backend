class AddForeignKeysToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :categories, foreign_key: true
    add_reference :items, :conditions, foreign_key: true
    add_reference :items, :rooms, foreign_key: true
  end
end
