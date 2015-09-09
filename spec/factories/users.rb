FactoryGirl.define do
  factory :user do
    sequence(:name){ |i| "us#{i}" }
    sequence(:email){ |i| "us#{i}@ad.ad" }
    password 'qwerty'
    password_confirmation{ |u| u.password } 
    info Faker::Lorem.paragraph(7)

    trait :regular do
      association :status, factory: :user_status
    end

    trait :manager do
      association :status, factory: :manager_status
    end

    trait :admin do
      association :status, factory: :admin_status
    end      
  end 
end

