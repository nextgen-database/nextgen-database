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
			file_path = "C:\\Users\\Neil Mispelaar\\Desktop\\Data\\test-data-expanded-2.csv"
			file_data = File.read(file_path)

			# Import CSV File
			data = CSV.parse(file_data, headers: true)

			data.each_with_index do |row, index|

				if false
					puts "- Prefix: #{row["Prefix"]}"
					puts "- First Name: #{row["First Name"]}"
					puts "- Last Name: #{row["Last Name"]}"
					puts "- Website: #{row["Website"]}"
					puts "- Email: #{row["Email"]}"
					puts "- Twitter: #{row["Twitter"]}"
					puts "- Linkedin: #{row["Linkedin"]}"
					puts "- Academia: #{row["Academia"]}"
					puts "Position Title: #{row["Position Title"]}"
					puts "Affiliated organizations: #{row["Affiliated organizations"]}"
					puts "- Sectors: #{row["Sectors"]}"
					puts "- Demographic Focus: #{row["Demographic Focus"]}"
					puts "- Development Actors: #{row["Development Actors"]}"
					puts "- Research Methods: #{row["Research Methods"]}"
					puts "- Countries: #{row["Countries"]}"
					puts "- Regions: #{row["Regions"]}"
					puts "- Subregions: #{row["Subregions"]}"
				end


				# Sanitise all position titles

				if false

					if row["SDG"].blank?

						puts "Whoops - SDG is blank #{index} : #{row["First Name"]} #{row["Last Name"]}"

					else

						# Strip any white space front and back and remove all alpha characters leaving only codes for each sdg
						sdgs_string = row["SDG"].delete("a-z").delete("A-Z").delete("-").delete("\s").strip

						# Split the array by ',' as a
						profile_sdgs = sdgs_string.strip.split(',')

						profile_sdgs.each do |p|

							# Strip whitespace front and back
							p = p.strip

							puts "SDG Code = #{p}"

							if !p.blank?

								sdg = SustainableDevelopmentGoal.where( code: p)
								if sdg.blank?
									puts "ERROR: Sustainable Development Goal not found: index: #{index} #{row["First Name"]} #{p} STRING: #{sdgs_string}"
								end

							end

						end

					end

				end

				if true

					# Tombstone Profile Information
					new_profile = Profile.create(
										firstname: row["First Name"],
										lastname: row["Last Name"],
										email: row["Email"],
										website: row["Website"],
										twitter: row["Twitter"],
										linkedin: row["Linkedin"],
										academia_edu: row["Academia"])

					#puts "Profile Data: #{new_profile.inspect}"

					#
					# Prefix
					#

					if !row["Prefix"].blank?

						# Find the Prefix

						profile_prefix = Prefix.find_by(english: row["Prefix"])

						if profile_prefix.blank?
							puts "ERROR: Prefix not found: #{row["Prefix"]}"
						else
							# Add the Prefix
							new_profile.prefix = profile_prefix

							# Save the profile
							new_profile.save!
						end

					end

					#
					# Sectors
					#

					if !row["Sectors"].blank?

						profile_sectors = row["Sectors"].strip.split(',')

						profile_sectors.each do |ps|

							# Strip whitespace front and back
							ps = ps.strip

							#puts "Sector = #{ps}"
							#	puts "%s %s %s %s" % [ row['person_id'], row['first_name'], row['last_name'],  row['person_prefix_id'] ]

							sector = Sector.find_by( english: ps)

							if sector.blank?
								puts "ERROR: Sector not found: #{ps}"
							else
								new_profile.sectors.push(sector)

								# Save the profile
								new_profile.save!
							end

						end

					end

					#
					# Countries
					#

					if !row["Countries"].blank?

						profile_countries = row["Countries"].strip.split(',')

						profile_countries.each do |pc|

							# Strip whitespace front and back
							pc = pc.strip

							#puts "Country = #{pc}"

							country = Country.find_by( english: pc)

							if country.blank?
								puts "ERROR: Country not found: #{pc}"
							else
								new_profile.countries.push(country)

								# Save the profile
								new_profile.save!
							end

						end

					end


					#
					# Demographic Focus
					#

					if !row["Demographic Focus"].blank?

						profile_demographic = row["Demographic Focus"].strip.split(',')

						profile_demographic.each do |p|

							# Strip whitespace front and back
							p = p.strip

							#puts "Demographic Factors = #{p}"

							demographic = Demographic.find_by( english: p)
							if demographic.blank?
								puts "ERROR: Demographic not found: #{p}"
							else
								new_profile.demographics.push(demographic)

								# Save the profile
								new_profile.save!
							end

						end

					end

					#
					# Development Actors
					#

					if !row["Development Actors"].blank?

						profile_development_actors = row["Development Actors"].strip.split(',')

						profile_development_actors.each do |p|

							# Strip whitespace front and back
							p = p.strip

							#puts "Development Actors = #{p}"

							development_actor = DevelopmentActor.find_by( english: p)
							if development_actor.blank?
								puts "ERROR: Development Actors not found: #{p}"
							else
								new_profile.development_actors.push(development_actor)

								# Save the profile
								new_profile.save!
							end

						end

					end


					#
					# Research Methods
					#

					if !row["Research Methods"].blank?

						profile_research_methods = row["Research Methods"].strip.split(',')

						profile_research_methods.each do |p|

							# Strip whitespace front and back
							p = p.strip

							#puts "Research Method = #{p}"

							research_method = ResearchMethod.find_by( english: p)

							if research_method.blank?
								puts "ERROR: Research Method not found: #{p}"
							else
								new_profile.research_methods.push(research_method)

								# Save the profile
								new_profile.save!
							end

						end

					end


					#
					# Regions
					#

					if !row["Regions"].blank?

						profile_regions = row["Regions"].strip.split(',')

						profile_regions.each do |p|

							# Strip whitespace front and back
							p = p.strip

							#puts "Region = #{p}"

							region = Region.find_by( english: p)
							if region.blank?
								puts "ERROR: Region not found: #{p}"
							else
								new_profile.regions.push(region)

								# Save the profile
								new_profile.save!
							end

						end

					end


					#
					# Subregions
					#
					if !row["Subregions"].blank?

					profile_subregions = row["Subregions"].strip.split(',')

						profile_subregions.each do |p|

							# Strip whitespace front and back
							p = p.strip

							#puts "Subregion = #{p}"

							subregion = Subregion.find_by( english: p)
							if subregion.blank?
								puts "ERROR: Subregion not found: #{p}"
							else
								new_profile.subregions.push(subregion)

								# Save the profile
								new_profile.save!
							end

						end

					end


					#
					# Sustainable Development Goals
					#

					if !row["SDG"].blank?

						# Strip any white space front and back and remove all alpha characters leaving only codes for each sdg
						sdgs_string = row["SDG"].delete("a-z").delete("A-Z").delete("-").delete("\s").strip

						# Split the array by ',' as a
						profile_sdgs = sdgs_string.strip.split(',')

						profile_sdgs.each do |p|

							# Strip whitespace front and back
							p = p.strip

							#puts "SDG Code = #{p}"

							if !p.blank?

								sdg = SustainableDevelopmentGoal.find_by( code: p)
								if sdg.blank?
									puts "ERROR: Sustainable Development Goal not found: #{p}"
								else
									new_profile.sustainable_development_goals.push(sdg)

									# Save the profile
									new_profile.save!
								end

							end

						end

					end



					#
					# Affiliation and Position
					#

					if !row["Affiliated organizations"].blank?

						# Find the Affiliation Org

						profile_affiliation_organisation = Organisation.find_by(english: row["Affiliated organizations"].strip)

						if profile_affiliation_organisation.blank?
							puts "ERROR: Affiliation Organisation not found: #{row["Affiliated organizations"].strip}"
						else

							# Get the profile object that we are working on
							organisation_id = Organisation.find_by(english: row["Affiliated organizations"].strip).id

							if organisation_id.blank?

								puts "ERROR: Organisation not found: #{p}"

							else

								new_affiliation = Affiliation.new
								new_affiliation.profile_id = new_profile.id

								new_affiliation.organisation_id = organisation_id

								# Save the affiliation
								new_affiliation.save!

								if !row["Position Title"].blank?

									affiliation_titles = row["Position Title"].strip.split(',')

									affiliation_titles.each do |p|

										# Create the position object and save it
										title = Title.find_by(english: p.strip)

										if !title.blank?

											position = Position.new
											position.title_id = title.id

											# Save the position
											position.save!

											# Add the affiliation_positions record to link affiliation to the
											#  newly created position
											affiliation_position = AffiliationPosition.new

											affiliation_position.affiliation_id = new_affiliation.id
											affiliation_position.position_id = position.id

											affiliation_position.save!

										else

											puts "ERROR: Position Title Not Found: #{p}"

										end

									end

								end

							end

						end

					end

				end

			end

			# Display all of the person ids
			#width = profile_keys.flatten.max.to_s.size+2
				#=> 4
			#puts profile_keys.map { |a| a.map { |i| i.to_s.rjust(width) }.join }

			puts "END..."

		end
	end
end
