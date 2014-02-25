require 'spec_helper'

describe MainController do

  describe "GET 'index'" do
    it "assigns actors" do
      get :index
      expect(assigns[:actors]).to eq(Actor.all)
    end
    it "sets up a new order" do
      get :index
      expect(assigns[:order]).to be_a(Order)
    end
    it "sets up a new query" do
      get :index
      expect(assigns[:query]).to be_a(Query)
    end
  end

end
