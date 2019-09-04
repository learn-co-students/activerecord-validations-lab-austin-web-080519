class Post < ActiveRecord::Base
    validates :title, presence: true
    validates(:content, { :length => { :minimum => 250 } })
    validates(:summary, { :length => { :maximum => 250 }})
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :click_baity?

    def click_baity?
        return false if title == nil
        /Won't Believe|Secret|Top \d+|Guess/.match(title) ? true : errors.add(:title, "error")
    end
end
