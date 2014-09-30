require 'rails_helper'

describe 'restaurants' do
  context 'can be added' do
    it 'by a person being prompted to add a restuarant' do
      visit restaurants_path
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_content 'Add a restaurant'
    end
  end

  context 'can be displayed' do
    before do
      Restaurant.create(name: 'KFC')
    end
    it 'after details have been added' do
      visit restaurant_path
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end
end
