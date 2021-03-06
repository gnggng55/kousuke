class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :property_name,     null: false
      t.text :address,             null: false
      t.text :remarks
      t.integer :parking_id
      t.integer :gas_id
      t.integer :property_kind_id, null: false
      t.timestamps
    end
  end
end
