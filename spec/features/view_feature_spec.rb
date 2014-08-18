require 'rails_helper'

describe 'reviewing restaurants' do
  before do
    @restaurant = Restaurant.create(name: 'KFC')
    # alex = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
    # login_as alex
    visit 'users/sign_up'
    fill_in 'user[email]', with: "a@a.com"
    fill_in 'user[password]', with: "12345678"
    fill_in 'user[password_confirmation]', with: "12345678"
    click_button 'Sign up'
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
    expect(page).to have_content 'So so (★★★☆☆)'
  end

end
