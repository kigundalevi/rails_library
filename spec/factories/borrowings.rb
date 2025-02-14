# spec/factories/borrowings.rb
FactoryBot.define do
    factory :borrowing do
      user
      book
      borrowed_date { Time.current }
      due_date { 2.weeks.from_now }
      returned_date { nil }
  
      trait :returned do
        returned_date { Time.current }
      end
    end
  end