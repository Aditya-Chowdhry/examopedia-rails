module Api::V1
class CommentsController < ApplicationController
  respond_to :json

  def index
      @comments = Comment.where(nil).order("title DESC")

      if stale? last_modified: @comments.maximum(:updated_at)
      respond_with @comments
      else

      end

   end

  def show
    @comment= Comment.approved.find(params[:id])
    respond_with @comment
  end

  def new
    @comment = Comment.new
    respond_with @comment
  end

  def create
    @comment = Comment.new(comment_params)
    respond_with @comment
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_with @comment
  end

  def update
  begin
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      respond_with @comment
    end
   end
  end

  def destroy
    @comment = Comment.find(params[:id])
    respond_with @comment.destroy
  end

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

  def comment_params
        params.require(:comment).permit(:title, :description,:section, :level, :comment_date, :image,:comment_review)
  end

  end

end
