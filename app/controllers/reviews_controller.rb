class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.new(params[:review].permit(:comment, :rating))

    if @restaurant.save
      redirect_to '/restaurants'
    else
      render 'new'
    end
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
