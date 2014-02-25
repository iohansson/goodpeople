require 'spec_helper'

describe Query do
  subject { FactoryGirl.build(:query) }
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
    it "retrieves latest by created_at queries" do
      FactoryGirl.create_list(:query, 20)
      expect(Query.latest).to eq(Query.order('created_at ASC').last(10))
    end
  end
end
