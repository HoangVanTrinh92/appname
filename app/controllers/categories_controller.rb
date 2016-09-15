class CategoriesController < ApplicationController
  before_action :load_category, only: [:show, :edit, :update, :destroy]
  before_action :new_category, only: :new

  def index
    @categories = Category.paginate(page: params[:page], per_page: Settings.paginate.medium_page)
  end

  def new
    @category = Category.new
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path }
      end
    end
  end

  def create
    @category = Category.new category_params
    @category.save ? flash[:success] = t("messages.create_success") : flash[:danger] = t("messages.create_fail")
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path }
      end
    end
  end

  def edit
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path }
      end
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "messages.update_success"
    else
      flash[:danger] = t "messages.update_fail"
    end
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path }
      end
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "messages.delete_success"
    else
      flash[:danger] = t "messages.delete_fail"
    end
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path }
      end
    end
  end

  private
  def load_category
    @category = Category.find params[:id]
  end

  def new_category
    @category = Category.new
  end

  def category_params
    params.require(:category).permit Category::ATTRIBUTES_PARAMS
  end
end
