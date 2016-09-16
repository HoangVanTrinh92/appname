class Admin::ProductAttachmentsController < ApplicationController
  before_action :set_product_attachment, only: [:destroy]

  def destroy
    product = @product_attachment.product
    @product_attachment.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_url(product), notice: 'Product attachment was successfully destroyed.' }
    end
  end

  private
  def set_product_attachment
    @product_attachment = ProductAttachment.find(params[:id])
  end
end
