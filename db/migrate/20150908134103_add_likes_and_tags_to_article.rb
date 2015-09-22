class AddLikesAndTagsToArticle < ActiveRecord::Migration

  def up
    add_column :articles, :tags,:string
    add_column :articles, :likes,:string
  end

  def down
    remove_column :articles, :tags,:string
    remove_column :articles, :likes,:string
  end


end
