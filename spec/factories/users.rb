# spec/factories/users.rb
FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "user#{n}@example.com" }
      password { 'password123' }
      admin { false }
  
      trait :admin do
        admin { true }
      end
    end
  end