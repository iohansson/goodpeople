class Photo < ActiveRecord::Base
  attr_accessible :image
  
  mount_uploader :image, ImageUploader
  
  belongs_to :actor
end
