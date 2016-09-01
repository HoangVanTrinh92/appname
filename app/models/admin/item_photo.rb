class Admin::ItemPhoto < ApplicationRecord
  mount_uploader :link, LinkUploader
  belongs_to :item
end
