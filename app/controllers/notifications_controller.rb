class NotificationsController < ApplicationController

load_and_authorize_resource
  respond_to :json, :html
  def index
     @notifications = Notification.approved.where(nil).order("title DESC")

      if stale? etag: @notifications
      respond_with @notifications.to_json(render: @notifications)
      else
      end

  end

  def show
    @notification= Notification.find(params[:id])
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      flash[:notice] = "Successfully created notification."
      redirect_to @notification
    else
      render :action => 'new'
    end
  end

  def edit
    @notification = Notification.find(params[:id])
  end

  def update
  begin
    @notification = Notification.find(params[:id])
    if @notification.update_attributes(notification_params)
      flash[:notice] = "Successfully updated notification."
      redirect_to @notification
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
    @notification = Notification.find(params[:id])
    @notification.destroy
    flash[:notice] = "Successfully destroyed notification."
    redirect_to notifications_url
  end

  private



  def notification_params
        params.require(:notification).permit(:title, :description,:section, :level, :notification_date, :image,:notification_review)
  end
end
