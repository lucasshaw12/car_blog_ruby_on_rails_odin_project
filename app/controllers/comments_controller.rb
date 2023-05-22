class CommentsController < ApplicationController
  before_action :set_post

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def create
     @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@article), notice: "Comment added successfully"
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other, notice: "Comment deleted successfully"
  end

  private

  def set_post
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status)
  end
end