require 'spec_helper'

describe Admin::PhotosController do
  include LoginMacros
  before do
    create_user_and_sign_in
  end
  
  describe "POST create" do
    let(:actor) { FactoryGirl.create(:actor) }
    let(:valid) { FactoryGirl.attributes_for(:photo, actor: actor) }
    it "redirects to actor on success" do
      valid
      post :create, photo: valid, actor_id: actor.id
      expect(response).to redirect_to admin_actor_url actor
    end
  end

  describe "DELETE destroy" do
    let(:photo) { FactoryGirl.create(:photo) }
    
    it "redirects to show actor" do
      photo
      delete :destroy, id: photo.id, actor_id: photo.actor.id
      expect(response).to redirect_to admin_actor_url photo.actor
    end
  end

end
