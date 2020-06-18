class TitleValidator < ActiveModel::Validator
  def validate(post)
    click_baits = ["Won't", 'Believe', 'Secret', 'Top', 'Guess']
    answer = false
    # binding.pry
    unless post.title.nil?
      post.title.split.each do |phrase|
        # answer = false if click_baits.include?(phrase)
        click_baits.each { |x| answer = true if x == phrase }
      end
    end
    # binding.pry
    post.errors[:title] << 'invalid' unless answer
    # answer
  end
end

class Post < ActiveRecord::Base
  validates_with TitleValidator
  #   validates :title, length: { minimum: 1 }
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 20 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

  #   def has_clickbait?
  #     click_baits = ["Won't", 'Believe', 'Secret', 'Top', 'Guess']
  #     unless title.nil?
  #       title.split.each do |phrase|
  #         return true if click_baits.include?(phrase)
  #       end
  #     end
  #     false
  #   end
end
