# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:borrowings) }
    it { should have_many(:books).through(:borrowings) }
  end

  describe '#admin?' do
    it 'returns true when user is admin' do
      admin = User.create(email: 'admin@example.com', password: 'password', admin: true)
      expect(admin.admin?).to be true
    end

    it 'returns false when user is not admin' do
      user = User.create(email: 'user@example.com', password: 'password', admin: false)
      expect(user.admin?).to be false
    end
  end
end