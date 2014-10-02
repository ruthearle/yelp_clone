require 'rails_helper'

describe Review, type: :model do
  it 'is not valid with arating of less than 1' do
    review = Review.new(rating: -1)
    expect{ review.valid? }.to change{ review.errors[:rating] }.to include('is not included in the list')
    expect(review).not_to be_valid
  end
end
