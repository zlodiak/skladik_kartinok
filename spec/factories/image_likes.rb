FactoryGirl.define do
  factory :image_like do
    association :user
    association :image
    created_at { Time.now }
    updated_at { Time.now }    
  end
end