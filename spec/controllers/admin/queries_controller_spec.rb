require 'spec_helper'

describe Admin::QueriesController do

  include LoginMacros
  
  before do
    create_user_and_sign_in
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
