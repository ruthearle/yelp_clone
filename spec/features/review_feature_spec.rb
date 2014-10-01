require 'rails_helper'

describe 'reviewing' do
  before do
    Restaurant.create(name: 'KFC',
                      description: 'The chicken place')
  end
  it 'a person can leave a review using a form that appears next to a restaurant' do
    visit restaurants_path
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'Side-breast is the bomb'
    click_button 'Leave review'
    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'Side-breast is the bomb'
  end
end
