FactoryGirl.define do
  factory :user do
    sequence(:name){ |i| "us#{i}" }
    sequence(:email){ |i| "us#{i}@ad.ad" }
    password 'qwerty'
    password_confirmation{ |u| u.password } 
    info Faker::Lorem.paragraph(7)

    trait :user_status do
      status_id 0
    end

    trait :manager_status do
      status_id 1
    end

    trait :admin_status do
      status_id 2
    end    
  end 
end

