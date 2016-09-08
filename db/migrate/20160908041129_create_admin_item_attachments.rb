class CreateAdminItemAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_item_attachments do |t|
      t.integer :item_id
      t.string :avatar

      t.timestamps
    end
  end
end
