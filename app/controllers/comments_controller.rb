class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def create
    @article = Article.find(params[:article_id])
    @comments = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    # redirect_to article_path(@comment)

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end