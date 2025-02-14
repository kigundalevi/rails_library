
require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:user, admin: true) }
  let(:valid_attributes) { { title: 'Test Book', author: 'Test Author', isbn: '1234567890' } }

  describe 'GET #index' do
    it 'returns a success response' do
      book = Book.create!(valid_attributes)
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'when user is admin' do
      before { sign_in admin }

      it 'creates a new Book' do
        expect {
          post :create, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end
    end

    context 'when user is not admin' do
      before { sign_in user }

      it 'does not create a new Book' do
        expect {
          post :create, params: { book: valid_attributes }
        }.to change(Book, :count).by(0)
      end
    end
  end
end