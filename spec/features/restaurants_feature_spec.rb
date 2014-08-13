require 'rails_helper'

describe 'restaurants' do
  context 'no restaurants have been added' do
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end

    it 'should be able to add a restaurant' do
      visit '/restaurants/new'
      # click_link 'Add a restaurant'


      fill_in 'Name', :with => 'KFC'
      fill_in 'Cuisine', :with => 'American'
      click_button 'Create Restaurant'

      expect(page).to have_content 'KFC'
      expect(page).to have_content 'American'
      expect(current_path).to eq '/restaurants'
    end

    context 'editing restaurants' do

      before do
        Restaurant.create(name: 'McDonalds', cuisine: 'American')
      end

      it 'should be able to add a restaurant' do
        visit '/restaurants'
        click_link 'Edit McDonalds'

        fill_in 'Name', :with => 'MCDONALDS'
        fill_in 'Cuisine', :with => 'Fastfood'
        click_button 'Update Restaurant'
        expect(page).to have_content 'MCDONALDS'
        expect(page).to have_content 'Fastfood'
        expect(current_path).to eq '/restaurants'

      end

      it 'should be able to delete a restaurant' do
        visit '/restaurants'
        click_link 'Delete McDonalds'

        expect(page).not_to have_content 'McDonalds'
        expect(page).to have_content "Deleted restaurant succesfully"
      end
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'McDonalds', cuisine: 'American')
    end

    it 'should display them' do
      visit '/restaurants'
      expect(page).to have_content 'McDonalds'
      expect(page).to have_link 'Add a restaurant'
    end
  end
end
