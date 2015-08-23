FactoryGirl.define do
  factory :status do
    sequence(:id){ |id| id }
    title 'user'
  end
end