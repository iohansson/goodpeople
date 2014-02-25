class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(params[:order])
    if @order.save
      OrderMailer.new_order(@order).deliver
      render partial: 'success', layout: false
    else
      @actors = Actor.all
      render partial: 'form', layout: false
    end
  end
  
  def show
  end
end
