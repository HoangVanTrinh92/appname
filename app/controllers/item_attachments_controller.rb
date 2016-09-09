class Admin::ItemAttachmentsController < ApplicationController
  before_action :set_admin_item_attachment, only: [:destroy]

  def destroy
    item = @admin_item_attachment.item
    @admin_item_attachment.destroy
    respond_to do |format|
      format.html { redirect_to admin_item_url(item), notice: 'Item attachment was successfully destroyed.' }
    end
  end

  private
    def set_admin_item_attachment
      @admin_item_attachment = Admin::ItemAttachment.find(params[:id])
    end

    def admin_item_attachment_params
      params.require(:admin_item_attachment).permit(:item_id, :avatar)
    end
end
