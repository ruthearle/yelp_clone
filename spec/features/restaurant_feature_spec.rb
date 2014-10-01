require 'rails_helper'

describe 'restaurants' do
  context 'have not been added' do
    it 'a person is prompted to add a restaurant' do
      visit restaurants_path
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'has already been added' do
    before do
      Restaurant.create(name: 'KFC')
    end
    it 'the names should be displayed' do
      visit restaurants_path
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context 'creating a restaurant' do
    it 'by a person completing a form' do
      visit restaurants_path
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(current_path).to eq restaurants_path
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context 'editing a restaurant' do
    before do
      Restaurant.create(name: 'KFC')
    end
    it 'a person can edit a restaurant' do
      visit restaurants_path
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(current_path).to eq restaurants_path
    end
  end

  context 'deleting a restaurant' do
    before do
      Restaurant.create(name: 'KFC')
    end
    it 'a person can delete a restaurant when they click a link' do
      visit restaurants_path
      click_link 'Delete KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
      expect(current_path).to eq '/restaurants'
    end
  end
end
