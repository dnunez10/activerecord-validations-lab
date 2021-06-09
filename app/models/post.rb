class Post < ActiveRecord::Base

    BAIT = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
    validate :click_bait

    def click_bait
        if title && BAIT.none?{|w| title.include?(w)}
            errors.add(:title, "not clickbait-y")
        end
    end
end
