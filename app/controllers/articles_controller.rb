class ArticlesController < ApplicationController
  load_and_authorize_resource
    respond_to :json , :html

    def index
       @articles = Article.approved.where(nil).order("title DESC")

        if stale? etag: @articles
        respond_with @articles.to_json(render: @articles)
        else

        end
        #fresh_when last_modified: @articles.maximum(:updated_at)
        #fresh_when @articles
      #respond_with @articles.to_json(render: @articles)
    end

    def approve
      @articles = Article.approved.newest
      respond_with @articles
    end

    def show
      @article= Article.find(params[:id])
      respond_with @article.to_json(render: @article)
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        flash[:notice] = "Successfully created article."
        redirect_to @article
      else
        render :action => 'new'
      end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
    begin
      @article = Article.find(params[:id])
      if @article.update_attributes(article_params)
        flash[:notice] = "Successfully updated article."
        redirect_to @article
      else
        render :action => 'edit'
      end
       rescue Exception => e
        Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
        # Rollbar.report_exception(e)
        nil
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      flash[:notice] = "Successfully destroyed article."
      redirect_to articles_url
    end

    private



    def article_params
      params.require(:article).permit(:title, :body,:author_name, :author_link, :tags, :likes,:article_review)
    end
  end
