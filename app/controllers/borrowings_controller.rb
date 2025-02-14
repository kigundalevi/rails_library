# app/controllers/borrowings_controller.rb
class BorrowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @borrowing = current_user.borrowings.build(
      book: @book,
      borrowed_date: Time.current,
      due_date: 2.weeks.from_now
    )

    if @borrowing.save
      redirect_to @book, notice: 'Book was successfully borrowed.'
    else
      redirect_to @book, alert: 'Unable to borrow book.'
    end
  end

  def return_book
    @borrowing = current_user.borrowings.find(params[:id])
    @borrowing.update(returned_date: Time.current)
    redirect_to profile_path, notice: 'Book was successfully returned.'
  end
end