class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :description
      t.string :exam_date
      t.string :form_date
      t.string :last_date
      t.string :link1
      t.string :link2
      t.attachment :image

      t.timestamps null: false
    end
  end
end
