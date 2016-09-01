class Admin::ItemsController < ApplicationController
  before_action :set_admin_item, only: [:show, :edit, :update, :destroy]

  def index
    @admin_items = Admin::Item.all
  end

  def show
    @item_photos = @admin_item.item_photos.all
  end

  def new
    @admin_item = Admin::Item.new
    @item_photo = @admin_item.item_photos.build
  end

  def edit
  end

  def create
    @admin_item = Admin::Item.new(admin_item_params)

    respond_to do |format|
      if @admin_item.save
        params[:item_photos]['link'].each do |a|
          @item_photo = @admin_item.item_photos.create!(:link => a)
        end
        format.html { redirect_to @admin_item, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_item.update(admin_item_params)
        params[:item_photos]['link'].each do |a|
          @item_photo = @admin_item.item_photos.create!(:link => a)
        end
        format.html { redirect_to @admin_item, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @admin_item.destroy
    respond_to do |format|
      format.html { redirect_to admin_items_url, notice: 'Item was successfully destroyed.' }
    end
  end

  private
    def set_admin_item
      @admin_item = Admin::Item.find(params[:id])
    end

    def admin_item_params
      params.require(:admin_item).permit Admin::Item::ATTRIBUTES_PARAMS
    end
end
