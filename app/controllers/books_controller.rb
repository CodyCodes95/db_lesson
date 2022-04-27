class BooksController < ApplicationController
  # DEBUG - REMOVE FOR PRODUCTION!!!
  skip_before_action :verify_authenticity_token

  def index
    @books = Book.all
  end

  def show
    begin
    @book = Book.find(params[:id])
    rescue
      render plain: "Book not found!"
    end
  end

  def create
    book = Book.create(book_params)
    redirect_to book
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book
  end

  private

  def book_params
    return params.permit(:title, :author_id)
  end
end
