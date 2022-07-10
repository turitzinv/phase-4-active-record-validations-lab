class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :title_clickbait

  def title_clickbait
    unless title.present? && title.include?("Won't Believe" || "Secret"|| "Top [number]"|| "Guess")
      errors.add(:title, "Your title is not clickbait")
    end
  end

end
