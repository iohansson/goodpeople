class Video < ActiveRecord::Base
  attr_accessible :actor_id, :video_id
  
  belongs_to :actor
  
  def embed_code
    "<iframe src='http://youtube.com/embed/#{video_id}'></iframe>"
  end
end
