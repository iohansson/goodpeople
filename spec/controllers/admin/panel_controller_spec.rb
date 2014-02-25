require 'spec_helper'

describe Admin::PanelController do
  include LoginMacros
  context "not logged in" do
    it "requires login" do
      require_admin_login
    end
  end
  context "logged in" do
    before do
      create_user_and_sign_in
    end
    describe "GET index" do
      it "should be success" do
        get :index
        expect(response.status).to eq(200)
      end
      it "assigns orders and queries" do
        get :index
        expect(assigns[:queries]).not_to be_nil
        expect(assigns[:orders]).not_to be_nil
      end
    end
  end
end
