FactoryGirl.define do
  factory :status_poll do
    sequence(:id){ |id| id }
    title 'Открыто'
  end
end