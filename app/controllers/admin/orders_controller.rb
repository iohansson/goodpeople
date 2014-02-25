class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.page(params[:page])
  end
end
