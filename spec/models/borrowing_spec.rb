# spec/models/borrowing_spec.rb
require 'rails_helper'

RSpec.describe Borrowing, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end
end