class Admin::ItemsController < ApplicationController
  before_action :set_admin_item, only: [:show, :edit, :update, :destroy]

  def index
    @admin_items = Admin::Item.all
  end

  def show
    @admin_item_attachments = @admin_item.item_attachments.all
  end

  def new
    @admin_item = Admin::Item.new
    @admin_item_attachment = @admin_item.item_attachments.build
  end

  def edit
  end

  def create
    @admin_item = Admin::Item.new(admin_item_params)

    respond_to do |format|
      if @admin_item.save
        if params[:item_attachments].present?
          params[:item_attachments]['avatar'].each do |a|
            @admin_item_attachment = @admin_item.item_attachments.create!(avatar: a)
          end
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
        params[:item_attachments]['avatar'].each do |a|
          @admin_item_attachment = @admin_item.item_attachments.create!(avatar: a)
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
