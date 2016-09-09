class StaticsController < ApplicationController
  def home
    @items = Admin::Item.all
  end
end
