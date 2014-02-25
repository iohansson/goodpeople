require 'spec_helper'

describe Video do
  subject { FactoryGirl.build(:video) }
  context "Association" do
    it "belongs to actor" do
      expect(subject).to respond_to(:actor)
    end
  end
  context "Rendering" do
    it "renders embed code" do
      video = FactoryGirl.build(:video)
      expect(video.embed_code).to eq("<iframe src='http://youtube.com/embed/#{video.video_id}'></iframe>")
    end
  end
end
