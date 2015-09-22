class Article < ActiveRecord::Base
  has_many :comments
  has_attached_file :image,styles: {thumb: "150x150>", medium: "700x500>", small: "350x350>"},processors: [:thumbnail, :compression]
  validates_attachment_content_type :image, :content_type => /\Aimage\/(jpg|jpeg|pjpeg|png|x-png|gif)\z/, :message => 'file type is not allowed (only jpeg/png/gif images)'
  
  scope :approved, -> {
  where(:article_review => false)
  }
  scope :pending, -> {
  where(:article_review => true)
  }
  scope :newest,-> {
  order("created_at desc")
  }

end
