class Admin::ItemAttachment < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :item
end
