class Exam < ActiveRecord::Base
	validates :title,:description,:image, :presence => true
	has_attached_file :image,styles: {thumb: "150x150>", medium: "1024x700>", small: "350x350>"},processors: [:thumbnail, :paperclip_optimizer]
	enum section: [:'Arts', :'Commerce',:'Science']
	enum level: [:'Undergraduate',:'Global',:'Postgraduate']
	#processors: [:thumbnail, :compression]

	#after_save :compress_with_ffmpeg
	#after_post_process :compress

	#http://stackoverflow.com/questions/21897725/papercliperrorsmissingrequiredvalidatorerror-with-rails-4
	#Starting with Paperclip version 4.0, all attachments are required to include a content_type validation, a file_name validation, or to explicitly state that they're not going to have either.
	validates_attachment_content_type :image, :content_type => /\Aimage\/(jpg|jpeg|pjpeg|png|x-png|gif)\z/, :message => 'file type is not allowed (only jpeg/png/gif images)'
	private

	def compress_with_ffmpeg
    [:thumb, :medium, :small].each do |type|
    img_path = self.image.path(type)
    Paperclip.run("ffmpeg", " -i #{img_path} #{img_path}")
    end
  end

   def compress

    current_format = File.extname(image.queued_for_write[:original].path)

    image.queued_for_write.each do |key, file|
      reg_jpegoptim = /(jpg|jpeg|jfif)/i
      reg_optipng = /(png|bmp|gif|pnm|tiff)/i

      logger.info("Processing compression: key: #{key} - file: #{file.path} - ext: #{current_format}")

      if current_format =~ reg_jpegoptim
        compress_with_jpegoptim(file)
      elsif current_format =~ reg_optipng
        compress_with_optpng(file)
      else
        logger.info("File: #{file.path} is not compressed!")
      end
    end
  end

  def compress_with_jpegoptim(file)
    current_size = File.size(file.path)
    Paperclip.run("jpegoptim", "-o --strip-all #{file.path}")
    compressed_size = File.size(file.path)
    compressed_ratio = (current_size - compressed_size) / current_size.to_f
    logger.debug("#{current_size} - #{compressed_size} - #{compressed_ratio}")
    logger.debug("JPEG family compressed, compressed: #{ '%.2f' % (compressed_ratio * 100) }%")
  end

  def compress_with_optpng(file)
    current_size = File.size(file.path)
    Paperclip.run("optipng", "-o7 --strip=all #{file.path}")
    compressed_size = File.size(file.path)
    compressed_ratio = (current_size - compressed_size) / current_size.to_f
    logger.debug("#{current_size} - #{compressed_size} - #{compressed_ratio}")
    logger.debug("PNG family compressed, compressed: #{ '%.2f' % (compressed_ratio * 100) }%")   
  end              
end
