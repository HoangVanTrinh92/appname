class OrdersController < ApplicationController
  before_action :load_order, only: :update

  def update
    if @order.update_attributes order_params
      flash[:success] = t "messages.update_success"
    else
      flash[:danger] = t "messages.update_fail"
    end
    respond_to do |format|
      if @order.save
        format.html { redirect_to cart_path }
      end
    end
  end

  private
  def load_order
    @order = Order.find params[:id]
  end

  def order_params
    params.require(:order).permit Order::ATTRIBUTES_PARAMS
  end
end
