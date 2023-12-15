class CreateCarItems < ActiveRecord::Migration[6.1]
  def change
    create_table :car_items do |t|

      t.integer :customer_id, null: false
      t.integer :item_id,     null: false
      t.integer :amount,      null: false

      t.timestamps
    end
  end
end
