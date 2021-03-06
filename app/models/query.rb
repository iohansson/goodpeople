class Query < ActiveRecord::Base
  attr_accessible :comment, :name, :phone
  
  validates :name, presence: true
  validates :phone, presence: true
  
  def self.ordered
    order('created_at DESC')
  end
  
  def self.latest
    ordered.first(10)
  end
  
  def self.page(page)
    ordered.paginate(page: page, per_page: 10)
  end
end
