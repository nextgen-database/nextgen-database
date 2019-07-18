# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
# Breaking apart seeds.rb into multiple files to make it more readible
# https://medium.com/@ethanryan/split-your-rails-seeds-file-into-separate-files-in-different-folders-3c57be765818

# Read through the seeds directory and join all of the files together
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
	load seed
end
