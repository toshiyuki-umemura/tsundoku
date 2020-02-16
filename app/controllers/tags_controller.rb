class TagsController < ApplicationController

  def new
  end

  def show
    @tags = Tag.where(tag: params[:tag]).pluck(:book_id)
    @books = Book.find(@tags)
  end
end
