class MyValidator < ActiveModel::Validator

  def validate(post)
    word_arr = ["Won't Believe", "Secret", "Top[number]",
                "Guess"]
    is_valid = false

    word_arr.each do |word|
      if post.title != nil
        if post.title.include? word
          is_valid = true
        end
      end
    end

    if is_valid == false
      post.errors[:title] << "Invalid"
    end

  end

end


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w( Fiction Non-Fiction)}

  include ActiveModel::Validations
  validates_with MyValidator
end
