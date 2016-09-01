class CreateAdminItems < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_items do |t|
      t.string :name
      t.integer :cost
      t.text :description

      t.timestamps
    end
  end
end
