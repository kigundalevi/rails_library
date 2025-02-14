
class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_admin!, only: [:new, :create]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  private

  def ensure_admin!
    unless current_user&.admin?
      redirect_to books_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end
end