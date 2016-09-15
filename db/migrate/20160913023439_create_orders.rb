class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.string :name
      t.string :phone_number
      t.string :address
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
