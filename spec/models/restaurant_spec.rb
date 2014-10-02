require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than 3 characters' do
    restaurant = Restaurant.new(name: 'kf')
    expect{restaurant.valid?}.to change{restaurant.errors[:name] }.to include('is too short (minimum is 3 characters)')
    expect(restaurant).not_to be_valid
  end

  it 'is not valid if the name is not unique'do
    Restaurant.create(name: 'KFC')
    restaurant = Restaurant.new(name: 'KFC')
    expect{ restaurant.valid? }.to change{ restaurant.errors[:name] }.to include('has already been taken')
  end

  describe '#average rating'do
    restaurant = Restaurant.new(name: "Mr Chow's")
    context 'no reviews'do
      it 'returns N/A' do
        expect(restaurant.average_rating).to eq 'N/A'
      end
    context '1 reviews' do
      it 'returns that rating' do
        restaurant = Restaurant.create(name: "Mr Chow's")
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq 4
      end
    end
    context 'multiple reviews' do
      it 'returns the average rating' do
        restaurant = Restaurant.create(name: "Mr Chow's")
        restaurant.reviews.create(rating: 3)
        restaurant.reviews.create(rating: 5)
        expect(restaurant.average_rating).to eq 4
      end
    end
  end
end
end
