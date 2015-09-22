class AddReviewToArticle < ActiveRecord::Migration
  def up
    add_column :articles, :article_review, :boolean, :default=> true
  end
  def down
  	remove_column :articles, :article_review
  end
end
