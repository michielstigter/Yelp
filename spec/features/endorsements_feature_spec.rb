require 'rails_helper'

describe 'endorsing reviews' do
  before do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, comment: 'OK')
    # alex = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
    # login_as alex
    visit 'users/sign_up'
    fill_in 'user[email]', with: "a@a.com"
    fill_in 'user[password]', with: "12345678"
    fill_in 'user[password_confirmation]', with: "12345678"
    click_button 'Sign up'
  end

  it "can endorse reviews, updating the review's like count", js=true do
    visit '/restaurants'
    click_link 'More info and reviews'
    click_link 'Like this review'
    expect(page).to have_content '1 like'
  end
end
