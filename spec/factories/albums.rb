FactoryGirl.define do
  factory :album do
    sequence(:title){ |i| "title#{i}" }
    user_id 1
    closed nil
    description 'g dgd fghf ghj gj gj gj gj g'
  end
end