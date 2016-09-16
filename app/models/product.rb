class Product < ApplicationRecord
  has_many :order_items
  has_many :product_attachments, dependent: :destroy

  default_scope { where(active: true) }
  accepts_nested_attributes_for :product_attachments, reject_if: proc { |attributes| attributes['avatar'].blank? }, allow_destroy: true
end
