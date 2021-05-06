class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.primary_key :id
      t.timestamp :order_date
      t.float :total
      t.text :description
      t.primary_key :ship_date

      t.timestamps
    end
  end
end
