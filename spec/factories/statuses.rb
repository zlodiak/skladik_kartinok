FactoryGirl.define do
  factory :user_status, class: Status do
    title 'User'
  end

  factory :manager_status, class: Status do
    title 'Manager'
  end

  factory :admin_status, class: Status do
    title 'Admin'
  end
end