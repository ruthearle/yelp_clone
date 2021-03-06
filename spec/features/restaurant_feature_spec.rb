require 'rails_helper'

describe 'restaurants homepage' do
  context 'no restaurants have been added' do
    it 'a person is prompted to add a restaurant' do
      visit restaurants_path
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'a restaurant has already been added' do
    before do
      Restaurant.create(name: 'KFC')
    end
    it 'the names should be displayed' do
      visit restaurants_path
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end
end

describe 'creating a restaurant' do
  context 'a valid restaurant' do
    it 'by a person completing a form' do
      visit restaurants_path
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      fill_in 'Description', with: 'Chicken shop'
      click_button 'Create Restaurant'
      expect(current_path).to eq restaurants_path
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context 'an invalid restaurant' do
    it 'does not let you submit with a anme that is too short' do
      visit restaurants_path
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'kf'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end
end

describe 'editing a restaurant' do
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

describe 'deleting a restaurant' do
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

describe 'showing the restaurant description' do
    before do
      Restaurant.create(name: 'KFC',
                        description: 'The chicken shop')
    end
    it 'when a person clicks on a link' do
      visit restaurants_path
      click_link 'Show KFC'
      expect(page).to have_content 'The chicken shop'
    end

    it 'after displaying a restaurant a person can go back to the main page' do
      visit restaurants_path
      click_link 'Show KFC'
      click_link 'Go back to restaurants'
      expect(current_path).to eq restaurants_path
    end
  end
