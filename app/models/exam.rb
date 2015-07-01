class Exam < ActiveRecord::Base
	validates :title,:description,:image, :presence => true
	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
	enum section: [:'Arts', :'Commerce',:'Science']
	enum level: [:'Undergraduate',:'Global',:'Postgraduate']
	
	#http://stackoverflow.com/questions/21897725/papercliperrorsmissingrequiredvalidatorerror-with-rails-4
	#Starting with Paperclip version 4.0, all attachments are required to include a content_type validation, a file_name validation, or to explicitly state that they're not going to have either.
	validates_attachment_content_type :image, :content_type => /\Aimage\/(jpg|jpeg|pjpeg|png|x-png|gif)\z/, :message => 'file type is not allowed (only jpeg/png/gif images)'

end
