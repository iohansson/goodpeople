class Actor < ActiveRecord::Base
  attr_accessible :description, :is_published, :name, :price
  
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 100 }
  
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  
  def avatar
    photos.first.image_url
  end
  
  def has_videos?
    videos.count > 0
  end
end
