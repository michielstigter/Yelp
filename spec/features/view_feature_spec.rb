require 'rails_helper'

describe 'reviewing restaurants' do
  before do
    @restaurant = Restaurant.create(name: 'KFC')
  end

  it 'allows users to leave reviews using a form, wich' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Comment', with: 'So so'
    select '3', from: 'Rating'
    click_button 'Create Review'
    puts "---------------------------"
    click_link 'More info and reviews'
    expect(current_path).to eq "/restaurants/#{@restaurant.id}/reviews"
    expect(page).to have_content 'So so (3)'
  end

end
