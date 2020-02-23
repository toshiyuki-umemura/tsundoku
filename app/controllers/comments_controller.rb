class CommentsController < ApplicationController
  def create
    @comment = Comment.create(content: comment_params[:content], book_id: comment_params[:book_id], user_id: current_user.id)
    if @comment.content.blank?
      redirect_to root_path
    else
      respond_to do |format|
        format.html { redirect_to book_path(params[:book_id]), notice: 'コメントが投稿されました' }
        format.json 
      end
    end
  end

  def destroy
    if Comment.find_by(id: params[:id], book_id: params[:book_id]).destroy
      flash[:notice] = "コメントを削除しました"
      redirect_to book_path(params[:book_id])
    else
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :book_id).merge(book_id: params[:book_id])
  end
end