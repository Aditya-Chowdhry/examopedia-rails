# create_table :notifications do |t|
#      t.string :title
#      t.string :description
#      t.string :exam_date
#      t.string :form_date
#      t.string :last_date
#      t.string :link1
#      t.string :link2
#      t.attachment :image

#      t.timestamps null: false

class Notification < ActiveRecord::Base
  validates :title,:description,:presence => true
  
  scope :approved, -> {
  where(:notification_review => false)
  }
  scope :pending, -> {
  where(:notification_review => true)
  }
  scope :newest,-> {
  order("created_at desc")
  }

end
