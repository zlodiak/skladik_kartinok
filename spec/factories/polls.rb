FactoryGirl.define do
  factory :poll do
    association :user
    sequence(:title){ |i| "title#{i}" }
    description Faker::Lorem.paragraph(7)

    trait :status_poll_open do
      status_poll_id 0
    end

    trait :status_poll_closed do
      status_poll_id 1
    end   
  end
end
