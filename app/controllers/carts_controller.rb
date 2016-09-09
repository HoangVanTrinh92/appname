class CartsController < ApplicationController

  def add
    id = params[:id]
    session[:cart] ? cart = session[:cart] : [session[:cart] = {}, cart = session[:cart]]
    cart[id] ? cart[id] = cart[id] + 1 : cart[id] = 1
    redirect_to action: :index
  end

  def clearCart
    session[:cart] = nil
    redirect_to action: :index
  end

  def index
    session[:cart] ? @cart = session[:cart] : @cart = {}
  end
end
