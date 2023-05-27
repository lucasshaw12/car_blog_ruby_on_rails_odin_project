class SearchController < ApplicationController
  # using ransack method, search for all matches using search_form_for GET method
  # sort returned results
  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end
end
