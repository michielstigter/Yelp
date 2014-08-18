class LikesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @review.likes.create

    @restaurant = @review.restaurant_id
    render json: { new_like_count: @review.likes.count }
    # redirect_to restaurant_reviews_path(@restaurant)
  end
end
