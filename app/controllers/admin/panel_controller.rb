class Admin::PanelController < Admin::ApplicationController
  def index
    @queries = Query.latest
    @orders = Order.latest
  end
end
