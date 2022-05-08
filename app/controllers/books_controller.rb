class BooksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :check_auth
  before_action :find_book, only: %i[show update destroy edit]
  before_action :set_authors, only: %i[new edit]

  def index
    @books = Book.all
  end

  def show
    # begin
    # rescue
    #   render plain: "Book not found!"
    # end
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create!(book_params)
    redirect_to book
  end

  def edit; end

  def update
    @book.update(book_params)
    redirect_to @book
  end

  def destroy
    @book.cover.purge
    @book.destroy
    redirect_to books_path
    # TEST
  end

  private

  def check_auth
    authorize Book
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def set_authors
    @authors = Author.order(:first_name)
  end

  def book_params
    return params.require(:book).permit(:title, :author_id, :cover)
  end
end
