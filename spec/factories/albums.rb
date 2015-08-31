FactoryGirl.define do
  factory :album do
    sequence(:title){ |i| "title#{i}" }
    association :user 
    closed nil
    description 'The behavior of the association method varies depending on the build strategy used for the parent object.'
  end
end