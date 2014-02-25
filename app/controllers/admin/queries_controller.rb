class Admin::QueriesController < ApplicationController
  def index
    @queries = Query.page(params[:page])
  end
end
