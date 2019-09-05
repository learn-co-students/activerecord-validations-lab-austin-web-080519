class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    
    #Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. 
    #If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should return false.
    
    validate :is_clickbait?

    Clickbaity = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
      ]
    
    def is_clickbait?
        if Clickbaity.none? { |pattern| pattern.match title }
          errors.add(:title, "must be clickbait")
        end
      end
end

