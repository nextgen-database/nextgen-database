# Extraction, Transformation and Loading
# Taking the data from the existing database and moving it into the new database
# https://stuff-things.net/2016/11/02/importing-legacy-data-into-your-rails-app/

# Require the PostgreSQL Gem
require 'pg'


namespace(:ng) do
	namespace(:move) do

		#
		# Testing the waters
		#
		desc "Migrate Profiles"
		task :profiles => :environment do
			begin



				#rs.each do |row|
				#	puts "COUNT %s" % [ rs[0]['count'] ]
				#end





				# Connect to the Database
				pg_db = PG.connect :dbname => 'nextgen-database-backup', :user => 'postgres', :password => '!W4i5p901'

				# Get the number of people in the database
				rs = pg_db.exec "SELECT COUNT(*) FROM public.people"


				# Create a 2d array of old and new primary keys
				# Old keys will be at [0] and new key will be [1]
				width = 2
				height = Integer(rs[0]['count'])
				profile_keys = Array.new(height){Array.new(width) { '0' } }

				# Clear the result set
				rs.clear if rs

				# GET all of the person_ids
				rs = pg_db.exec "SELECT id
								 FROM
									 public.people
								 ORDER BY id ASC"

				# Loop through the results and save each person id in the array in index[X][0]
				rs.each_with_index do |row, index|
					profile_keys[index][0] = row['id']
				end

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|

					# puts "Key for index: #{index} #{profile_keys[index][0]}"

					# Start by creating the entry for the profile
					rs = pg_db.exec "SELECT *
										FROM
											public.people
										JOIN
											public.person_translations
										ON
											public.people.id = public.person_translations.person_id
										WHERE
											public.person_translations.person_id = " + profile_keys[index][0] + "
										ORDER BY public.person_translations.person_id ASC
										LIMIT 1"


					#rs.each_with_index do |row, index_a|
					#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]
#
#					end

					new_profile = Profile.create(firstname: rs[0]['first_name'],
									lastname: rs[0]['last_name'],
									website: rs[0]['website'],
									twitter: rs[0]['twitter'],
									linkedin: rs[0]['linkedin'],
									academia_edu: rs[0]['academia_edu'],
									prefix_id: rs[0]['person_prefix_id'])

					# Save the profile in the db
					new_profile.save!

					# Update the array with the returned profile_id
					profile_keys[index][1] = new_profile.id.to_s

				end


				#
				# Website Override from Affiliation
				# Algorithm:
				# 	If someone's website is blank check if the affiliation website is set and then
				# 	load that onto the profile
				#


				#
				# Affiliations
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|

					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT
											organization_translations.name
										FROM
											affiliation_translations
										JOIN
											affiliations
										ON
											affiliations.id = affiliation_translations.affiliation_id
										JOIN
											organization_translations
										ON
											affiliations.organization_id = organization_translations.organization_id
										WHERE
											person_id ="+  profile_keys[index][0].to_s + " LIMIT 1"


					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						puts "Affiliation Organisation: #{row['name']}"
						puts "Current Profile ID: #{profile_keys[index][1]}"

						#puts "Organisation ID: #{Organisation.where(english: row['name']).id}"
						#puts "Current Profile ID: #{profile_keys[index][1]}"

						# Get the profile object that we are working on
						affiliation = Affiliation.new
						affiliation.profile_id = profile_keys[index][1]

						organisation_id = Organisation.find_by(english: row['name'].strip).id
						affiliation.organisation_id = organisation_id

						# Save the affiliation
						affiliation.save!

						#puts "Affiliation Added: #{profile_keys[index][1].to_s} #{row['name']}"

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end



				#
				# Positions
				#








				#
				# Users
				#


				# Display all of the person ids
				#width = profile_keys.flatten.max.to_s.size+2
 				 #=> 4
				#puts profile_keys.map { |a| a.map { |i| i.to_s.rjust(width) }.join }



				#rs.each_with_index do |row, index|
				#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]



					#Profile.create(firstname: row['first_name'],
					#				lastname: row['last_name'] )

				#	new_profile = Profile.new
					#new_profile.accessible = :all # if you're using dynamic attr_accessible

				#	new_profile.prefix = Prefix.where(english: "Dr.").find(1)

				#	new_profile.attributes = {
				#		:firstname => row['first_name'],
				#		:lastname => row['last_name']
				#	}
					#new_profile.save!

					#profile_keys[index][0] = row['person_id']
					#profile_keys[index][1] = new_profile.id.to_s


#
#					SELECT *
#					FROM
#					public.people_countries
#					JOIN public.people ON
#					public.people.id=public.people_countries.person_id
#					JOIN public.country_translations ON
#					public.people_countries.country_id=public.country_translations.country_id
#					WHERE
#					public.people.id=1 AND public.country_translations.locale='en'
#


#rs = pg_db.exec "SELECT *
#									FROM
#									public.person_translations
#									JOIN public.people ON
#									public.people.id=public.person_translations.person_id
#									WHERE
#									public.people.id=1
#									LIMIT 1"
#



				#end

				#width = profile_keys.flatten.max.to_s.size+2
 				 #=> 4
				#puts profile_keys.map { |a| a.map { |i| i.to_s.rjust(width) }.join }



			rescue PG::Error => e

				puts e.message

			ensure

				rs.clear if rs
				pg_db.close if pg_db

			end
		end
	end
end
