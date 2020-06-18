# class MyValidator < ActiveModel::EachValidator
#   def validate(post)
#     unless post.title.include?"Won't believe"||"Secret"||"Top[0-9]"||"Guess"
#       post.errors[:title] << "More Click-bait please!"
#     end
#   end
# end

class Post < ActiveRecord::Base
  # include ActiveModel::Validations
  validates :title,presence:true
  validates :content,length:{minimum: 250}
  validates :summary,length:{maximum:250}
  validates :category,inclusion: {in: ["Fiction","Non Fiction"]}
  validate :check_for_click_bait

  def check_for_click_bait
    if title == nil
      errors.add(:title, "title can't be nil")
    elsif title.exclude?("Won't Believe"||"Secret"|| "Top [number]"|| "Guess")
          errors.add(:title, "title needs more clickbait")
    else
   end
 end
end
