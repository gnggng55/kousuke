class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :property_name,       null: false
      
      t.timestamps
    end
  end
end
