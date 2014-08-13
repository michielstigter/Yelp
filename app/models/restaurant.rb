class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def average_rating
    return 'N/A' if reviews.none?

    reviews.inject(0) do |sum, review|
      @total = sum+review.rating
    end
    @total/reviews.count
  end
end
