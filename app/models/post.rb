class Post < ActiveRecord::Base
    
    # validate :custom_validation
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validates :title, inclusion: { in: %w("Won't Believe", "Secret", "Top [number]", "Guess")}


# private


#     def custom_validation
#         @post = Post.pluck(:title)
#         if @post




end
