class Order < ActiveRecord::Base
  attr_accessible :actor_id, :comment, :event_date, :name, :phone
  
  validates :name, presence: true
  validates :phone, presence: true
  
  belongs_to :actor
  
  def self.ordered
    order('created_at DESC')
  end
  
  def self.latest
    ordered.first(10)
  end
  
  def self.page(page)
    ordered.paginate(page: page, per_page: 10)
  end
  
  def actor_name
    actor.name if actor
  end
end
