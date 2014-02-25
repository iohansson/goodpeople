require 'spec_helper'

describe Order do
  subject { FactoryGirl.build(:order) }
  context "Validation" do
    %w[name phone].each do |attr|
      it "must have #{attr}" do
        subject.send("#{attr}=",nil)
        expect(subject).not_to be_valid
        expect(subject.errors[attr]).not_to be_nil
      end
    end
  end
  context "Scoping" do
    it "retrieves latest by created_at orders" do
      FactoryGirl.create_list(:order, 20)
      expect(Order.latest).to eq(Order.order('created_at DESC').first(10))
    end
  end
  context "Misc" do
    it "retrieves actor name" do
      order = FactoryGirl.create(:order)
      expect(order.actor_name).to eq(order.actor.name)
    end
  end
end
