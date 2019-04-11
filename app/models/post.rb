class Post < ActiveRecord::Base

	# validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Non-Fiction Fiction)}
	validate :clickbaity



	def clickbaity

		arr = ["Won't Believe", "Secret", "Top [number]", "Guess"]
		clickbait = false
		if(!title.nil?)
			arr.each do |phrase|
				title.match?(phrase) ? (clickbait = true) : ()
			end
		end
		if !clickbait || title.nil?
			errors.add(:title, "title isn't clickbaity")
		end
	end

	## To work on: finding out how to have an included validator and custom validator

end
