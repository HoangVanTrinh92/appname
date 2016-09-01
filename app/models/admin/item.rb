class Admin::Item < ApplicationRecord
  ATTRIBUTES_PARAMS = [:name, :cost, :description, item_photos_attributes: [:id, :item_id, :link, :_destroy]]

  has_many :item_photos, dependent: :destroy
  accepts_nested_attributes_for :item_photos, reject_if: ->{param[:link].blank?}, allow_destroy: true
end
