class RestaurantsController < ApplicationController


	def index
		@restaurants = restaurant.all
	end
end
