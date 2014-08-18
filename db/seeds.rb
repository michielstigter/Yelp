# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

kfc = Restaurant.create(name: 'KFC')
kfc.reviews.create(rating: 1, comment: 'Bad')
kfc.reviews.create(rating: 2, comment: 'Poor')
kfc.reviews.create(rating: 3, comment: 'OK')
kfc.reviews.create(rating: 4, comment: 'Good')
kfc.reviews.create(rating: 5, comment: 'Great')

nandos = Restaurant.create(name: 'Nandos')
nandos.reviews.create(rating: 1, comment: 'Really Bad')
nandos.reviews.create(rating: 2, comment: 'Really Poor')
nandos.reviews.create(rating: 3, comment: 'Really OK')
nandos.reviews.create(rating: 4, comment: 'Really Good')
nandos.reviews.create(rating: 5, comment: 'Really Great')

wasabi = Restaurant.create(name: 'Wasabi')
wasabi.reviews.create(rating: 1, comment: 'Bad')
wasabi.reviews.create(rating: 2, comment: 'Poor')
wasabi.reviews.create(rating: 3, comment: 'OK')
wasabi.reviews.create(rating: 4, comment: 'Good')
wasabi.reviews.create(rating: 5, comment: 'Great')
