class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,      null: false
      t.string :product_number, null: false
      t.integer :price,         null: false
      t.integer :rate
      t.integer :gas_id
      t.timestamps
    end
  end
end
