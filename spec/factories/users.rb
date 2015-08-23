FactoryGirl.define do
  factory :user do
    sequence(:name){ |i| "us#{i}" }
    sequence(:email){ |i| "us#{i}@ad.ad" }
    password 'qwerty'
    password_confirmation{ |u| u.password } 
    #status_id FactoryGirl.create(:status0)  
  end
end

