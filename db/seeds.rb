# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.where(name: 'Ruby').first_or_create(name: 'Ruby')
Category.where(name: 'CSS').first_or_create(name: 'CSS')
Category.where(name: 'HTML').first_or_create(name: 'HTML')
Category.where(name: 'Java').first_or_create(name: 'Java')
Category.where(name: 'Python').first_or_create(name: 'Python')
Category.where(name: 'Swift').first_or_create(name: 'Swift')
Category.where(name: 'Objective C').first_or_create(name: 'Objective C')

 
