class CreateAdminItemPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_item_photos do |t|
      t.integer :item_id
      t.string :link

      t.timestamps
    end
  end
end
