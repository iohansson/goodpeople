require 'spec_helper'

describe Actor do
  subject { FactoryGirl.build :actor }

  context "Validation" do
    %w[name].each do |attr|
      it "must have #{attr}" do
        subject.send("#{attr}=", nil)
        expect(subject).not_to be_valid
        expect(subject.errors[attr]).not_to be_nil
      end
    end
  end
  
  context "Association" do
    it "has many photos" do
      expect(subject).to respond_to :photos
    end
    it "has many videos" do
      expect(subject).to respond_to :videos
    end
  end
  
  context "Images" do
    it "has avatar" do
      expect(subject).to respond_to :avatar
    end
  end
  context "Videos" do
    let(:video) { FactoryGirl.create(:video) }
    let(:actor) { FactoryGirl.create(:actor) }
    
    it "has videos?" do
      expect(video.actor.has_videos?).to eq(true)
      expect(actor.has_videos?).to eq(false)
    end
  end
  context "Scoping" do
    it "retieves published" do
      actor = FactoryGirl.create(:actor)
      unpublished_actor = FactoryGirl.create(:actor, is_published: false)
      expect(Actor.published.all).to eq([actor])
    end
  end
end
