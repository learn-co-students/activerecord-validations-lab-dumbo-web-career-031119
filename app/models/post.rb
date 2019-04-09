class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :the_worst_ever

    def the_worst_ever
        if !/(Won't\sBelieve|Secret|Top\s\d|Guess)/.match(title)
            errors.add(:title, "Your title isn't something truly hateful! Try again!")
        end
    end
    
end
