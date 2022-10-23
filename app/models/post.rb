class Post < ApplicationRecord

    validate :must_have_clickbait

    def must_have_clickbait
        if title.present? && title.exclude?("Won't Believe" || "Secret" || "Top" || "Guess")
            errors.add(:title, "Needs more clickbait")
        end
        
    end

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

end
