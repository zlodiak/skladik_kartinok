FactoryGirl.define do
  factory :user do
    name 'qqq'
    sequence(:email){ |i| "use#{i}@ad.ad" }
    password 'qwerty'
    password_confirmation{ |u| u.password } 
  end
end