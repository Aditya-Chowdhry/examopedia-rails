class AddFeesToExams < ActiveRecord::Migration
  def change
    add_column :exams, :gen_fees_boys, :integer
    add_column :exams, :gen_fees_girls, :integer
    add_column :exams, :sc_fees_boys, :integer
    add_column :exams, :sc_fees_girls, :integer
    add_column :exams, :others_note, :string
    add_column :exams, :others, :integer
  end
end
