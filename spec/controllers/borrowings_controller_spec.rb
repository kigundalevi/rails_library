# spec/controllers/borrowings_controller_spec.rb
require 'rails_helper'

RSpec.describe BorrowingsController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  describe 'POST #create' do
    context 'when user is signed in' do
      before { sign_in user }

      it 'creates a new borrowing' do
        expect {
          post :create, params: { book_id: book.id }
        }.to change(Borrowing, :count).by(1)
      end

      it 'sets the correct due date' do
        post :create, params: { book_id: book.id }
        expect(Borrowing.last.due_date).to be_within(1.second).of(2.weeks.from_now)
      end
    end

    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        post :create, params: { book_id: book.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH #return_book' do
    let!(:borrowing) { create(:borrowing, user: user, book: book) }

    context 'when user is signed in' do
      before { sign_in user }

      it 'updates the returned_date' do
        patch :return_book, params: { id: borrowing.id }
        expect(borrowing.reload.returned_date).to be_present
      end
    end
  end
end