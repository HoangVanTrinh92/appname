class Admin::Item < ApplicationRecord
  ATTRIBUTES_PARAMS = [:name, :cost, :description, admin_item_attachments_attributes: [:id, :item_id, :avatar, :_destroy]]
  has_many :item_attachments, dependent: :destroy
  has_many :cart_items
  has_many :carts, through: :cart_items
  accepts_nested_attributes_for :item_attachments, reject_if: proc { |attributes| attributes['avatar'].blank? }, allow_destroy: true
end
