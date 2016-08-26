class Admin::ProductsController < ApplicationController
  before_action :load_product, only: [:edit, :update, :destroy, :show]

  def index
    @search = Product.ransack params[:q]
    @products = @search.result.order(created_at: :desc).page params[:page]
  end

  def new
    @product = Product.new
    respond_to do |format|
      format.js{render layout: false}
    end
  end

  def create
    create_new_product
    respond_to do |format|
      format.js{render layout: false}
      format.html{redirect_to :back}
    end
  end

  def edit
    respond_to do |format|
      format.js{render layout: false}
    end
  end

  def update
    if @product.update product_params
      flash[:success] = t "messages.update_success"
    else
      flash[:danger] = t "messages.update_fail"
    end
    respond_to do |format|
      format.js{render layout: false}
      format.html{redirect_to :back}
    end
  end

  def show

  end

  def destroy
    if @product.destroy
      flash[:success] = t "messages.delete_success"
    else
      flash[:danger] = t "messages.delete_fail"
    end
    redirect_to :back
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "messages.load_data_fail"
    redirect_to root_path
  end

  def create_new_product
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "messages.create_success"
    else
      flash[:danger] = t "messages.create_fail"
    end
  end
end
