
  class AddExamReviewToExams < ActiveRecord::Migration
   def up
    change_table :exams do |t|
      t.boolean :exam_review, :default => true
    end
  end

  def down
    remove_column :exams, :exam_review
    end
  
end


