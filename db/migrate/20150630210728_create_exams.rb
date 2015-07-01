class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.string :description
      t.integer :section
      t.integer :level
      t.attachment :image
      t.datetime :exam_date
      t.date :form_release_date
      t.date :form_last_date
      t.string :link1_name
      t.string :link1
      t.string :link2_name
      t.string :link2
      t.string :link3_name
      t.string :link3
      t.string :link4_name
      t.string :link4

      t.timestamps null: false
    end
  end
end
