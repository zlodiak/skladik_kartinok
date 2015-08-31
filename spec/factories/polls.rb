FactoryGirl.define do
  factory :poll do
    association :user
    sequence(:title){ |i| "title#{i}" }
    description Faker::Lorem.paragraph(7)

    trait :poll_with_status_poll_0 do
      after :build, :create do |poll|
       status_poll = create :status_poll, id: 0, title: "Открыто"
       poll.status_poll = status_poll
      end
    end

    trait :poll_with_status_poll_1 do
      after :build, :create do |poll|
       status_poll = create :status_poll, id: 1, title: "Закрыто"
       poll.status_poll = status_poll
      end
    end    
  end
end
