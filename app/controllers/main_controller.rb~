class MainController < ApplicationController
  def index
    @actors = Actor.all
    @order = Order.new
    @query = Query.new
    @actors_grouped = @actors.in_groups_of(4,false)
  end
end
