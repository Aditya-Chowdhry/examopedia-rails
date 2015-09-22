class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.string :name

      t.timestamps null: false
    end
  end
end
