# Extraction, Transformation and Loading
# Taking the data from the existing database and moving it into the new database
# https://stuff-things.net/2016/11/02/importing-legacy-data-into-your-rails-app/

# Require the PostgreSQL Gem
require 'pg'


namespace(:ng) do
	namespace(:moves) do

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
				# COUNTRIES
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|


					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT
										public.country_translations.name
									FROM
										public.people_countries
									JOIN public.people ON
										public.people.id=public.people_countries.person_id
									JOIN public.country_translations ON
										public.people_countries.country_id=public.country_translations.country_id
									WHERE
										public.people.id=" +  profile_keys[index][0].to_s + " AND public.country_translations.locale='en'"

					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						country = Country.where( english: row['name'])
						profile.countries.push(country)

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end

				#
				# REGIONS
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|


					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT name

										FROM public.people_regions

										JOIN public.region_translations

										ON public.people_regions.region_id = public.region_translations.region_id

										WHERE person_id =" + profile_keys[index][0].to_s + " AND public.region_translations.locale='en'"


					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						region = Region.where( english: row['name'])
						profile.regions.push(region)

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end



				#
				# SUBREGIONS
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|


					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT name

										FROM public.people_subregions

										JOIN public.subregion_translations

										ON public.people_subregions.subregion_id = public.subregion_translations.subregion_id

										WHERE person_id =" + profile_keys[index][0].to_s + " AND public.subregion_translations.locale='en'"


					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						subregion = Subregion.where( english: row['name'])
						profile.subregions.push(subregion)

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end




				#
				# SECTORS
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|


					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT name

										FROM public.people_sectors

										JOIN public.sector_translations

										ON public.people_sectors.sector_id = public.sector_translations.sector_id

										WHERE person_id =" + profile_keys[index][0].to_s + " AND public.sector_translations.locale='en'"

					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						sector = Sector.where( english: row['name'])
						profile.sectors.push(sector)

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs


				end


				#
				# RESEARCH METHODS
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|


					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT name

										FROM public.people_research_methods

										JOIN public.research_method_translations

										ON public.people_research_methods.research_method_id = public.research_method_translations.research_method_id

										WHERE person_id =" + profile_keys[index][0].to_s + " AND public.research_method_translations.locale='en'"

					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						research_method = ResearchMethod.where( english: row['name'])
						profile.research_methods.push(reseearch_method)

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end



				#
				# DEMOGRAPHIC
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|


					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT name

										FROM public.people_demographics

										JOIN public.demographic_translations

										ON public.people_demographics.demographic_id = public.demographic_translations.demographic_id

										WHERE person_id =" + profile_keys[index][0].to_s + " AND public.demographic_translations.locale='en'"

					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						demographic = Demographic.where( english: row['name'])
						profile.demographics.push(demographic)

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end


				#
				# DEVELOPMENT ACTORS
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|


					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT name

										FROM public.people_development_actors

										JOIN public.development_actor_translations

										ON public.people_development_actors.development_actor_id = public.development_actor_translations.development_actor_id

										WHERE person_id =" + profile_keys[index][0].to_s + " AND public.development_actor_translations.locale='en'"

					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						development_actor = DevelopmentActor.where( english: row['name'])
						profile.development_actors.push(development_actor)

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end




				#
				# Email Addresses
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|

					email = ""

					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT *
									FROM
										public.affiliations
									WHERE
										person_id ="+  profile_keys[index][0].to_s + "
									ORDER BY person_id asc"

					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						if !row['email'].blank?
							email = row['email']
						end

					end

					puts "Email: #{email}"

					if !email.blank?

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						profile.email = email

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end



				#
				# Phone Number
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|

					phone_number = ""

					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT phone_number
									FROM
										public.affiliations
									WHERE
										person_id ="+  profile_keys[index][0].to_s + "
									ORDER BY person_id asc"

					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						if !row['phone_number'].blank?
							phone_number = row['phone_number']
						end

					end

					puts "Phone Number: #{phone_number}"

					if !phone_number.blank?

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						profile.phone_number = phone_number

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end



				#
				# Phone Extension
				#

				# Clear the result set because we're done with it
				rs.clear if rs

				# Now that we have each person_id we need to walk through the database and get each person and their data
				profile_keys.each_with_index do |profile, index|

					phone_ext = ""

					# Lets get the countries for each entry
					rs = pg_db.exec "SELECT phone_extension
									FROM
										public.affiliations
									WHERE
										person_id ="+  profile_keys[index][0].to_s + "
									ORDER BY person_id asc"

					rs.each_with_index do |row, index_b|
						#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

						if !row['phone_extension'].blank?
							phone_ext = row['phone_extension']
						end

					end

					puts "Phone Number Extension: #{phone_ext}"

					if !phone_ext.blank?

						# Get the profile object that we are working on
						profile = Profile.find_by_id( profile_keys[index][1].to_s )
						profile.phone_ext = phone_ext

						# Save the profile
						profile.save!

					end

					# Clear the result set because we're done with it
					rs.clear if rs

				end








				# Display all of the person ids
				width = profile_keys.flatten.max.to_s.size+2
 				 #=> 4
				puts profile_keys.map { |a| a.map { |i| i.to_s.rjust(width) }.join }



			rescue PG::Error => e

				puts e.message

			ensure

				rs.clear if rs
				pg_db.close if pg_db

			end
		end
	end
end
