class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :author_name
      t.string :author_link
      t.attachment :image
      t.timestamps null: false
    end
  end
end
