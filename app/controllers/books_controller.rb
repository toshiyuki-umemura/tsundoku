class BooksController < ApplicationController
  def index
  end

  def new
    @book = Book.new
    @book.tags.build
  end

  def create
    @book = current_user.books.create(book_params)
  end

  private
  def book_params
    params.require(:book).permit( :title, :content, tags_attributes: [:id, :book_id, :tag])
  end

end
