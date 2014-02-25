require 'spec_helper'

describe QueriesController do
  let(:valid) { FactoryGirl.attributes_for(:query) }
  let(:invalid) { FactoryGirl.attributes_for(:query, name: nil) }
  describe "POST create" do
    it "render success template on success" do
      post :create, query: valid
      expect(response).to render_template(partial: '_success')
    end
    it "renders new template on error" do
      post :create, query: invalid
      expect(response).to render_template(partial: '_form')
    end
    it "sends mail message on new query" do
      deliveries = ActionMailer::Base.deliveries
      expect {
        post :create, query: valid
      }.to change{deliveries.count}.by(1)
      expect(deliveries.last.to).to eq(['ludihoroshie@gmail.com'])
    end
  end
end
