class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number, null: false
      t.string :construction_detail
      t.string :construction_time_id
      t.text :instruction
      t.text :remarks_room
      t.references :property, null: false, foreign_key: true
      t.timestamps
    end
  end
end
