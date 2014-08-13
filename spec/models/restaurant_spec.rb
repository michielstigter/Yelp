require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

  let (:restaurant) { Restaurant.create(name: 'Nandos')}

  describe '#average_rating' do
    context 'no reviews' do
      it 'returns N/A' do
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end

    context '1 review' do
      it 'returns that rating' do
        restaurant.reviews.create("rating" => 5)
        expect(restaurant.average_rating).to eq 5
      end
    end

    context 'multiple reviews' do
      it 'returns the average' do
        restaurant.reviews.create("rating" => 5)
        restaurant.reviews.create("rating" => 3)
        expect(restaurant.average_rating).to eq 4
      end
    end
  end

  describe 'validations' do
    it 'is not valid if it is not unique' do
      Restaurant.create(name: 'Nandos')
      restaurant = Restaurant.new(name: 'Nandos')
      expect(restaurant).to have(1).error_on(:name)
    end
  end
end
