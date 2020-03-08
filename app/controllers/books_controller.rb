class BooksController < ApplicationController
  before_action :redirect_root, only: [:new, :edit]
  include Pagy::Backend
  
  def index
    @pagy, @books = pagy(Book.all.includes(:user).order("created_at DESC"))
    @tags = Tag.includes(:book).group(:tag).pluck(:book_id)
    @book_tags = Book.find(@tags)
  end

  def new
    @book = Book.new
    @book.tags.build
  end

  def create
    @book = current_user.books.create(book_params)
    if @book.save
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      if @book.update(book_params)
        flash[:notice] = "投稿を更新しました"
        redirect_to root_path
      else
        render :edit
      end
    else
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.user_id == current_user.id
      if book.destroy
        flash[:notice] = "投稿を削除しました"
        redirect_to root_path
      else
        render :index
      end
    else
      redirect_to root_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.includes(:user)
    @comment = Comment.new
  end

  private
  def book_params
    params.require(:book).permit( :title, :content, tags_attributes: [:id, :book_id, :tag])
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

end
