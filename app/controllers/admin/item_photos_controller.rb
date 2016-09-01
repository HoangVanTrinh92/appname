class Admin::ItemPhotosController < ApplicationController
  before_action :set_admin_item_photo, only: [:show, :edit, :update, :destroy]

  # GET /admin/item_photos.json
  def index
    @admin_item_photos = Admin::ItemPhoto.all
  end

  # GET /admin/item_photos/1
  # GET /admin/item_photos/1.json
  def show
  end

  # GET /admin/item_photos/new
  def new
    @admin_item_photo = Admin::ItemPhoto.new
  end

  # GET /admin/item_photos/1/edit
  def edit
  end

  # POST /admin/item_photos
  # POST /admin/item_photos.json
  def create
    @admin_item_photo = Admin::ItemPhoto.new(admin_item_photo_params)

    respond_to do |format|
      if @admin_item_photo.save
        format.html { redirect_to @admin_item_photo, notice: 'Item photo was successfully created.' }
        # format.json { render :show, status: :created, location: @admin_item_photo }
      else
        format.html { render :new }
        # format.json { render json: @admin_item_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/item_photos/1
  # PATCH/PUT /admin/item_photos/1.json
  def update
    respond_to do |format|
      if @admin_item_photo.update(admin_item_photo_params)
        format.html { redirect_to @admin_item_photo.item, notice: 'Item photo was successfully updated.' }
        # format.json { render :show, status: :ok, location: @admin_item_photo }
      else
        format.html { render :edit }
        # format.json { render json: @admin_item_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/item_photos/1
  # DELETE /admin/item_photos/1.json
  def destroy
    @admin_item_photo.destroy
    respond_to do |format|
      format.html { redirect_to admin_item_photos_url, notice: 'Item photo was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_item_photo
      @admin_item_photo = Admin::ItemPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_item_photo_params
      params.require(:admin_item_photo).permit(:item_id, :link)
    end
end


