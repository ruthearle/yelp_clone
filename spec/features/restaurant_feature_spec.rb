require 'rails_helper'

describe 'restaurants' do
  context 'can be added' do
    it 'by a user being prompted to add a restuarant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_content 'Add a restaurant'
    end
  end
end
