FactoryGirl.define do
  factory :album do
    sequence(:title){ |i| "title#{i}" }
    association :user 
    closed nil
    description Faker::Lorem.paragraph(7)
  end
end