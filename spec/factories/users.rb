FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'password'
    password_confirmation 'password'

    trait :blank_email do
      email ''
    end

    trait :blank_password do
      password ''
    end

    trait :blank_password_confirmation do
      password_confirmation ''
    end
  end
end
