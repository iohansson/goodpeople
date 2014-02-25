require 'spec_helper'

describe Admin::VideosController do
  include LoginMacros

  let(:actor) { FactoryGirl.create(:actor) }
  let(:valid) { FactoryGirl.attributes_for(:video) }
  let(:video) { FactoryGirl.create(:video) }
  before do
    create_user_and_sign_in
  end
  
  describe "POST create" do
    it "redirects to actor on success" do
      actor
      post 'create', actor_id: actor.id, video: valid
      expect(response).to redirect_to(admin_actor_url(actor))
    end
  end

  describe "DELETE destroy" do
    it "redirects to actor on success" do
      video
      delete 'destroy', actor_id: video.actor.id, id: video.id
      expect(response).to redirect_to(admin_actor_url(video.actor))
    end
  end

end
