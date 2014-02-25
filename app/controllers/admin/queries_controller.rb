class Admin::QueriesController < Admin::ApplicationController
  def index
    @queries = Query.page(params[:page])
  end
end
