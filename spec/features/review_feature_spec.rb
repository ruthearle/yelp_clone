require 'rails_helper'

describe 'reviewing' do
  before do
    Restaurant.create(name: 'KFC',
                      description: 'The chicken place')
  end

  def leaving_review(thoughts, rating)
    visit restaurants_path
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  it 'a person can leave a review using a form that appears next to a restaurant' do
    leaving_review('Side-breast is the bomb', 3)
    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'Side-breast is the bomb (3)'
  end

  it 'shows that average rating of reviews that have been left' do
    leaving_review('So so', 3)
    leaving_review('Really good', 5)
    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'Average rating: ★★★★☆'
  end

  it 'shows the time stamp of the review' do
    Timecop.freeze(Time.now)
    leaving_review('So so', 3)
    expect(current_path).to eq restaurants_path
    Timecop.travel(Time.now + 1)
    expect(page).to have_content 'posted less than a minute ago'
  end
end
