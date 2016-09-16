class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product_attachments = @product.product_attachments.all
  end

  def new
    @product = Product.new
    @product_attachment = @product.product_attachments.build
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        unless params[:product_attachments].nil?
          params[:product_attachments]['avatar'].each do |a|
            @product_attachment = @product.product_attachments.create!(avatar: a)
          end
        end
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        unless params[:product_attachments].nil?
          params[:product_attachments]['avatar'].each do |a|
            @product_attachment = @product.product_attachments.create!(avatar: a)
          end
        end
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :active, product_attachments_attributes: [:id, :product_id, :avatar, :_destroy])
    end
end
