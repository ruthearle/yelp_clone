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
end
