class ExamsController < ApplicationController
  respond_to :json, :html
  
  def index
    @exams = Exam.all
    respond_with @exams.to_json(render: @exams)
  
  end
  
  def show
    @exam= Exam.find(params[:id])
  end
  
  def new
    @exam = Exam.new
  end
  
  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      flash[:notice] = "Successfully created exam."
      redirect_to @exam
    else
      render :action => 'new'
    end
  end
  
  def edit
    @exam = Exam.find(params[:id])
  end
  
  def update
    @exam = Exam.find(params[:id])
    if @exam.update_attributes(exam_params)
      flash[:notice] = "Successfully updated exam."
      redirect_to @exam
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    flash[:notice] = "Successfully destroyed exam."
    redirect_to exams_url
  end
  private
    def exam_params
        params.require(:exam).permit(:title, :description,:section, :level, :exam_date, :image)
      end
end
