module Api::V1
class ArticlesController < ApplicationController
  respond_to :json
  def index
      @articles = Article.where(nil).order("title DESC")

      if stale? last_modified: @articles.maximum(:updated_at)
      respond_with @articles
      else

      end

   end


  def show
    @article= Article.approved.find(params[:id])
    respond_with @article
  end


  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

  def article_params
        params.require(:article).permit(:title,:body,:section, :level, :article_date, :image,:article_review)
  end

  end
end
