class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @book.tags.build
  end

  def create
    @book = current_user.books.create(book_params)
  end
  
  def destroy
    book = Book.find(params[:id])
    if book.user_id == current_user.id
      book.destroy
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit( :title, :content, tags_attributes: [:id, :book_id, :tag])
  end

end
