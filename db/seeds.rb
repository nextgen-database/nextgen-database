# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


profiles = Profile.create([
  {
    firstname: 'Apple',
    middlename: 'Basic Fruit',
    lastname: '0.25'
  },
  {
    firstname: 'Watermellon',
    middlename: 'Fruit mainly composed of Water',
    lastname: '3.00'
  }
])
