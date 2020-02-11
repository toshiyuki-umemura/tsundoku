class CommentsController < ApplicationController
  def create
    @comment = Comment.create(content: comment_params[:content], book_id: comment_params[:book_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to book_path(params[:book_id]) }
      format.json 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :book_id).merge(book_id: params[:book_id])
  end
end