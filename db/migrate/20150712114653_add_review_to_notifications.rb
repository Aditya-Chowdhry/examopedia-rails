class AddReviewToNotifications < ActiveRecord::Migration
  def up
    add_column :notifications, :notification_review, :boolean, :default=> true
  end
  def down
  	remove_column :notifications, :notification_review
  end
end
