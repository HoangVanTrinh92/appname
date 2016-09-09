class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all
  end

  def show
    @item_attachments = @item.item_attachments.all
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit Item::ATTRIBUTES_PARAMS
    end
end
