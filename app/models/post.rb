class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_must_contain

    def title_must_contain
        unless title =~ /(Won't\sBelieve)|(Secret)|(Top\s\d)|(Guess)/
            errors.add(:title)
        end
    end
end
