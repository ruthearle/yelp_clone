require 'rails_helper'

describe 'restaurants' do
  context 'have not been added' do
    it 'a person is prompted to add a restuarant' do
      visit restaurants_path
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'has already been added' do
    before do
      Restaurant.create(name: 'KFC')
    end
    it 'should display the restaurants' do
      visit restaurants_path
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  #context 'can be added' do
    #it 'by a person completing a form' do
      #visit restaurant_path
      #click_link 'Add a restaurant'
      #fill_in 'Name', :with 'KFC'
      #fill_in 'Description' :with, 'Chicken and fries'
      #click_button 'Create restaurant'
      #expect(current_path).to eq restaurant_path
      #expect(page).to have_content 'KFC'
      #expect(page).not_to have_content 'No restaurants yet'
    #end
  #end
end
