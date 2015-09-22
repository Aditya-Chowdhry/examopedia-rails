class CommentsController < ApplicationController
  load_and_authorize_resource
    respond_to :json , :html

    def index
       @comments = Comment.approved.where(nil).order("title DESC")

        if stale? etag: @comments
        respond_with @comments.to_json(render: @comments)
        else

        end
        #fresh_when last_modified: @comments.maximum(:updated_at)
        #fresh_when @comments
      #respond_with @comments.to_json(render: @comments)
    end

    def approve
      @comments = Comment.approved.newest
      respond_with @comments
    end

    def show
      @comment= Comment.find(params[:id])

    end

    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        flash[:notice] = "Successfully created comment."
        redirect_to @comment
      else
        render :action => 'new'
      end
    end

    def edit
      @comment = Comment.find(params[:id])
    end

    def update
    begin
      @comment = Comment.find(params[:id])
      if @comment.update_attributes(comment_params)
        flash[:notice] = "Successfully updated comment."
        redirect_to @comment
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
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:notice] = "Successfully destroyed comment."
      redirect_to comments_url
    end

    private



    def comment_params
      params.require(:comment).permit(:title, :description,:section, :level, :comment_date, :image,:comment_review)
    end
  end
