module Api::V1
class ExamsController < ApplicationController
#  before_filter :restrict_access
  respond_to :json

  def index
      @exams = Exam.where(nil).order("title DESC")

      if stale? last_modified: @exams.maximum(:updated_at)
      respond_with @exams
      else

      end

   end

  def show
    @exam= Exam.approved.find(params[:id])
    respond_with @exam
  end

  def new
    @exam = Exam.new
    respond_with @exam
  end

  def create
    @exam = Exam.new(exam_params)
    respond_with @exam
  end

  def edit
    @exam = Exam.find(params[:id])
    respond_with @exam
  end

  def update
  begin
    @exam = Exam.find(params[:id])
    if @exam.update_attributes(exam_params)
      respond_with @exam
    end
   end
 end

  def destroy
    @exam = Exam.find(params[:id])
    respond_with @exam.destroy
  end

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

  def exam_params
        params.require(:exam).permit(:title, :description,:section, :level, :exam_date, :image,:exam_review)
  end

  end
end
