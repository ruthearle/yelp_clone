# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kfc = Restaurant.create(name: 'KFC')
kfc.reviews.create(rating: 1, thoughts: "rubbish")
kfc.reviews.create(rating: 2, thoughts: "not bad")
kfc.reviews.create(rating: 3, thoughts: "ok")
kfc.reviews.create(rating: 4, thoughts: "quite good")
kfc.reviews.create(rating: 5, thoughts: "brilliant")

yummies = Restaurant.create(name: 'Yummies')
yummies.reviews.create(rating: 1, thoughts: "god awful")
yummies.reviews.create(rating: 2, thoughts: "alright")
yummies.reviews.create(rating: 3, thoughts: "meh")
yummies.reviews.create(rating: 4, thoughts: "nice")
yummies.reviews.create(rating: 5, thoughts: "gorgeous")
