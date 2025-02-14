# spec/models/book_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      book = Book.new(
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        isbn: '978-0743273565'
      )
      expect(book).to be_valid
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:isbn) }
    it { should validate_uniqueness_of(:isbn) }
  end

  describe 'associations' do
    it { should have_many(:borrowings) }
    it { should have_many(:users).through(:borrowings) }
  end
end