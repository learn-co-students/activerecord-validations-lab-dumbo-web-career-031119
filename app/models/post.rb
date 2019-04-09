class Post < ActiveRecord::Base

  validates_presence_of :title
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum:250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "Category must be either Fiction or Non-Fiction" }
  validate :clickbait_titles

    # @titles = [
    #   /Won't Believe/i,
    #   /Secret/i,
    #   /Top [number]/i,
    #   /Guess/i
    # ]

    def clickbait_titles
      if !/(Won't\sBelieve|Secret|Top\s\d|Guess)/.match(title)
        errors.add(:title, "Lol this title will get no views, change it asap")
      end
    end
end
