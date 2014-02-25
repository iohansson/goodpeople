class QueriesController < ApplicationController
  def new
    @query = Query.new
  end
  
  def create
    @query = Query.new(params[:query])
    if @query.save
      QueryMailer.new_query(@query).deliver
      render partial: 'success', layout: false
    else
      render partial: 'form', layout: false
    end
  end
  
  def show
  end
end
