FactoryGirl.define do
  factory :user do
    name 'qqq'
    sequence(:email){ |i| "u#{i}@ad.ad" }
    password 'qwerty'
    password_confirmation{ |u| u.password } 
  end
end