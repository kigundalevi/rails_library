# spec/factories/books.rb
FactoryBot.define do
    factory :book do
      sequence(:title) { |n| "Book Title #{n}" }
      sequence(:author) { |n| "Author #{n}" }
      sequence(:isbn) { |n| "978000000000#{n}" }
    end
  end