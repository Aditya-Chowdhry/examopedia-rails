class AddLinkNameToNotifications < ActiveRecord::Migration
   def up
     change_column :notifications, :description,  :text	,:limit => 140	
     add_column :notifications,:link1_name,:string
     add_column :notifications,:link2_name,:string
    end
#http://stackoverflow.com/questions/2799774/rails-migration-for-change-column
  def down
    		
    remove_column :notifications,:link1_name,:string
     remove_column :notifications,:link2_name,:string
 end
end
