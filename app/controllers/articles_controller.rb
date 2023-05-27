class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.order(updated_at: :desc)
    @article.update(views: @article.views + 1)

    mark_notifications_as_read
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article, notice: 'Article created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: 'Article updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, status: :see_other, notice: 'Article deleted successfully'
  end

  # All private methods ensure only the class they're initialized in can access the method
  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def mark_notifications_as_read
    return unless current_user

    notifications_to_mark_as_read = @article.notifications_as_article.where(recipient: current_user)
    notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
  end
end
