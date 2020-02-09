class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
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

end
