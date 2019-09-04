class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_validation

    private def clickbait_validation
        if /Won't Believe|Secret|Top \d+|Guess/.match?(title) == false
            errors.add(:title, "Needs to be Clickbait")
        end
    end
end

