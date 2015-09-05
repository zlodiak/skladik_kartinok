FactoryGirl.define do
  factory :album do
    sequence(:title){ |i| "title#{i}" }
    association :user 
    description Faker::Lorem.paragraph(7)
    created_at { Time.now }
    updated_at { Time.now }
    
    trait :closed_nil do
      closed nil
    end

    trait :closed_true do
      closed true
    end    
  end
end