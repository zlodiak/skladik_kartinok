FactoryGirl.define do
  factory :image do
    association :user
    association :album
    association :poll
    created_at { Time.now }
    updated_at { Time.now }
    image_file_size Faker::Number.number(4)    
    image_file_name Faker::Lorem.characters(7) + '.jpg'
    image_content_type 'image/jpeg'
    image_updated_at { Time.now }
    description Faker::Lorem.paragraph(7)

    trait :is_delete_nil do
      is_delete nil
    end

    trait :is_delete_true do
      is_delete true
    end     
  end
end