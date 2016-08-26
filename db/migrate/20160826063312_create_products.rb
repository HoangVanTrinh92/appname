class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :pro_num, null: false
      t.integer :cost
      t.integer :old_cost

      t.timestamps
    end
  end
end
