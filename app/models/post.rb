class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_must_be_clickbait
    def title_must_be_clickbait
        unless /Won't Believe|Secret|Top \d+|Guess/.match(title)
          errors.add(:title, "must be clickbait")
        end
    end
end
