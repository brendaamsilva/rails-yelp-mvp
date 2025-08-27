class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true,
                     numericality: { only_integer: true },
                     inclusion: { in: 0..5 }
  validate  :rating_must_look_like_integer_text, if: -> { rating_before_type_cast.present? }

  private

  # Catches cases like rating = "five" that SQLite/AR may coerce to 0.
  def rating_must_look_like_integer_text
    raw = rating_before_type_cast
    return if raw.is_a?(Integer) || raw.to_s.match?(/\A[+-]?\d+\z/)

    errors.add(:rating, "must be an integer")
  end
end
