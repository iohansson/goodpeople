require 'spec_helper'

describe Admin::SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST create" do
    let(:user) { FactoryGirl.create(:user, email: "e@mail.com", password: "pass", password_confirmation: "pass") }
    it "redirects to panel index on success" do
      user
      post :create, email: "e@mail.com", password: "pass"
      expect(response).to redirect_to admin_url
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
