# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actor do
    name "Иван Иванов"
    price 10000
    description "Ведущий, веду"
    is_published true
    
    factory :actor_with_photo_video_comments do      
      after :create do |actor|
        5.times.map do
          FactoryGirl.create(:photo, actor_id: actor.id)
        end
      end
    end
  end
end
