# Extraction, Transformation and Loading
# Taking the data from the existing database and moving it into the new database
# https://stuff-things.net/2016/11/02/importing-legacy-data-into-your-rails-app/

# Require the CSV Gem
require 'csv'

namespace(:ng) do
	namespace(:import) do

		#
		# Testing the waters
		#
		desc "Migrate Profiles"
		task :csv => :environment do


			# Set the file path
			file_path = "C:\\Users\\Neil Mispelaar\\Desktop\\Data\\test-data.csv"
			file_data = File.read(file_path)

			# Import CSV File
			data = CSV.parse(file_data, headers: true)

			data.each do |row|

				puts "Prefix: #{row["Prefix"]}"
				puts "First Name: #{row["First Name"]}"
				puts "Last Name: #{row["Last Name"]}"
				puts "Website: #{row["Website"]}"
				puts "Email: #{row["Email"]}"
				puts "Twitter: #{row["Twitter"]}"
				puts "Linkedin: #{row["Linkedin"]}"
				puts "Academia: #{row["Academia"]}"
				puts "Position Title: #{row["Position Title"]}"
				puts "Affiliated organizations: #{row["Affiliated organizations"]}"
				puts "Sectors: #{row["Sectors"]}"
				puts "Demographic Focus: #{row["Demographic Focus"]}"
				puts "Development Actors: #{row["Development Actors"]}"
				puts "Research Methods: #{row["Research Methods"]}"
				puts "Countries: #{row["Countries"]}"
				puts "Regions: #{row["Regions"]}"
				puts "Subregions: #{row["Subregions"]}"
				puts "SDG: #{row["SDG"]}"

			end

			# Display all of the person ids
			#width = profile_keys.flatten.max.to_s.size+2
				#=> 4
			#puts profile_keys.map { |a| a.map { |i| i.to_s.rjust(width) }.join }

			puts "END..."

		end
	end
end
