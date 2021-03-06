require 'spec_helper'

describe Admin::ActorsController do
  include LoginMacros
  
  before do
    create_user_and_sign_in
  end
  
  it "requires login" do
    require_admin_login
  end
  
  describe "GET index" do
    it "assigns actors" do
      get :index
      expect(assigns[:actors]).to eq(Actor.all)
    end
  end
  
  describe "GET new" do
    it "assigns actor" do
      get :new
      expect(assigns[:actor]).to be_a(Actor)
    end
  end 
  
  describe "POST create" do
    before do
      @valid = FactoryGirl.attributes_for :actor
      @invalid = FactoryGirl.attributes_for :actor, name: nil
    end
    it "redirects to index on success" do
      post :create, actor: @valid
      expect(response).to redirect_to(admin_actor_url(Actor.last))
    end
    it "renders new on fail" do
      post :create, actor: @invalid
      expect(response).to render_template(:new)
    end
  end
  
  describe "DELETE destroy" do
    before do
      @actor = FactoryGirl.create(:actor)
    end
    it "redirects to index" do
      delete :destroy, id: @actor.id
      expect(response).to redirect_to(admin_actors_url)
    end
  end
end
