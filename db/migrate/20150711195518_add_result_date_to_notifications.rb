class AddResultDateToNotifications < ActiveRecord::Migration
  def up
    add_column :notifications, :result_date,:datetime
  end

  def down
    remove_column :notifications, :result_date
    end
end
