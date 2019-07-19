# Extraction, Transformation and Loading
# Taking the data from the existing database and moving it into the new database
# https://stuff-things.net/2016/11/02/importing-legacy-data-into-your-rails-app/


namespace(:ng) do
	namespace(:update) do

		#
		# Testing the waters
		#
		desc "Migrate Profiles"
		task :sdgs => :environment do

            # Hash table of Sector to SDG values
            sector_sdg_hash = Hash.new

            sector_sdg_hash["Accountability"] = [  "16" ]
            sector_sdg_hash["Activism"] = [  "10" ]
            sector_sdg_hash["Agricultural education/training"] = [  "2" ]
            sector_sdg_hash["Agricultural policy"] = [  "2" ]
            sector_sdg_hash["Agriculture"] = [  "2" ]
            sector_sdg_hash["Aid"] = [  "8", "10" , "17" ]
            sector_sdg_hash["Aid effectiveness"] = [  "10" ]
            sector_sdg_hash["Biodiversity"] = [  "15" ]
            sector_sdg_hash["Canadian policy"] = [  "16" , "10" ]
            sector_sdg_hash["Capacity building"] = [  "1" , "11" , "17" , "6" ]
            sector_sdg_hash["Children's rights including child protection"] = [  "5" , "8" , "16" ]
            sector_sdg_hash["Citizenship"] = [  "16" ]
            sector_sdg_hash["Clean technology"] = [  "7" ]
            sector_sdg_hash["Climate change"] = [  "13" , "11" , "2" ]
            sector_sdg_hash["Climate finance"] = [  "13" ]
            sector_sdg_hash["Community development"] = [  "11" ]
            sector_sdg_hash["Conflict"] = [  "16" ]
            sector_sdg_hash["Conflict prevention"] = [  "16" ]
            sector_sdg_hash["Conflict resolution"] = [  "16" ]
            sector_sdg_hash["Colonialism"] = [  "17" ]
            sector_sdg_hash["Conservation"] = [  "14" , "15" ]
            sector_sdg_hash["Consumption and production"] = [  "12" ]
            sector_sdg_hash["Corporate accountability"] = [  "12" ]
            sector_sdg_hash["Corporate social responsibility"] = [  "4" ]
            sector_sdg_hash["Critical studies"] = [  "4" ]
            sector_sdg_hash["Culture"] = [  "10" , "11" , "12" , "4" ]
            sector_sdg_hash["Data"] = [  "17" ]
            sector_sdg_hash["Debt cancellation and debt relief"] = [  "17" ]
            sector_sdg_hash["Decentralization"] = [  "16" ]
            sector_sdg_hash["Democracy"] = [  "16" ]
            sector_sdg_hash["Democratic participation"] = [  "5" , "10" ]
            sector_sdg_hash["Development economics"] = [  "8" ]
            sector_sdg_hash["Development education"] = [  "4" ]
            sector_sdg_hash["Development effectiveness"] = [  "17" ]
            sector_sdg_hash["Development financing"] = [  "1" , "2" , "3" , "7" , "8" , "11" , "13" , "14" , "15" , "17" ]
            sector_sdg_hash["Dictatorships"] = [  "16" ]
            sector_sdg_hash["Disability"] = [  "1", "4" , "10", "11" ]
            sector_sdg_hash["Disarmament"] = [  "16" ]
            sector_sdg_hash["Disaster risk reduction"] = [  "11" , "12" ]
            sector_sdg_hash["Displacement"] = [  "10" ]
            sector_sdg_hash["Economic development"] = [  "8" , "9" ]
            sector_sdg_hash["Economic growth"] = [  "8" ]
            sector_sdg_hash["Economics"] = [  "8" , "9" ]
            sector_sdg_hash["Ecosystems"] = [  "14" , "15" ]
            sector_sdg_hash["Education"] = [  "4" , "9" , "12" , "13" ]
            sector_sdg_hash["Education policy"] = [  "4" ]
            sector_sdg_hash["Elections"] = [  "16" ]
            sector_sdg_hash["Emergency preparedness"] = [ "1" , "11" ]
            sector_sdg_hash["Employment"] = [  "8" , "9" ]
            sector_sdg_hash["Empowerment"] = [  "5" , "10" ]
            sector_sdg_hash["Energy"] = [  "7" , "12" ]
            sector_sdg_hash["Environment"] = [  "12" ]
            sector_sdg_hash["Environmental assessment"] = [  "13" ]
            sector_sdg_hash["Environmental policy"] = [  "11" , "13" ]
            sector_sdg_hash["Environmental protection"] = [  "12" ]
            sector_sdg_hash["Ethics"] = [  "16" ]
            sector_sdg_hash["Ethnicity"] = [  "10" ]
            sector_sdg_hash["Evaluation"] = [ "12" , "17" ]
            sector_sdg_hash["Extractive industries"] = [  "14" ]
            sector_sdg_hash["Female genital mutilation"] = [  "5" ]
            sector_sdg_hash["Feminism"] = [ "2" , "3" , "3" , "4" , "5" , "6" , "8"]
            sector_sdg_hash["Financial inclusion"] = [ "5" , "8" , "10" ]
            sector_sdg_hash["Financial services"] = [ "8" , "9" , "17" ]
            sector_sdg_hash["Financial system"] = [ "10" , "17" ]
            sector_sdg_hash["Fishing/fisheries"] = [ "14" ]
            sector_sdg_hash["Food security"] = [ "2" , "12" ]
            sector_sdg_hash["Food sovereignty"] = [  "2" , "14" ]
            sector_sdg_hash["Forced migration"] = [  "10" ]
            sector_sdg_hash["Forestry"] = [  "15" ]
            sector_sdg_hash["Gender"] = [  "1" , "4" , "8" , "11" ]
            sector_sdg_hash["Gender equality"] = [ "5" ]
            sector_sdg_hash["Gender-based violence"] = [  "5" , "16" ]
            sector_sdg_hash["Global citizenship"] = [ "16" ]
            sector_sdg_hash["Global governance"] = [  "16" ]
            sector_sdg_hash["Globalization"] = [ "10" , "16" ]
            sector_sdg_hash["Governance"] = [ "16" , "17" ]
            sector_sdg_hash["Health"] = [ "2" , "3" , "12" ]
            sector_sdg_hash["Health policy"] = [ "5" , "3" ]
            sector_sdg_hash["Health reproductive"] = [  "5" ]
            sector_sdg_hash["History"] = [ ]
            sector_sdg_hash["HIV/AIDS"] = [ "3" ]
            sector_sdg_hash["Human rights"] = [  "1" , "10" , "16" ]
            sector_sdg_hash["Human security"] = [ "16" ]
            sector_sdg_hash["Humanitarian assistance"] = [ "17" ]
            sector_sdg_hash["Humanitarian law"] = [ "16" , "17" ]
            sector_sdg_hash["Inclusion"] = [ "9" , "10" , "11" ]
            sector_sdg_hash["Income"] = [  "8" , "9" , "14"  , "15"]
            sector_sdg_hash["Indigenous rights"] = [  "4" ]
            sector_sdg_hash["Industrial policy"] = [  "9" ]
            sector_sdg_hash["Inequality"] = [  "5" , "10" ]
            sector_sdg_hash["Information and Communication Technologies"] = [  "9" ]
            sector_sdg_hash["Infrastructure"] = [  "7" , "9" ]
            sector_sdg_hash["Innovation"] = [  "9" ]
            sector_sdg_hash["International finance"] = [ "8" , "10" , "17" , "11" , "2" ]
            sector_sdg_hash["International law"] = [  "16" ]
            sector_sdg_hash["Judicial systems"] = [  "16" ]
            sector_sdg_hash["Justice"] = [  "16" ]
            sector_sdg_hash["Knowledge and learning"] = [  "4" ]
            sector_sdg_hash["Labour rights"] = [  "8" ]
            sector_sdg_hash["Land grabbing"] = [  "2" ]
            sector_sdg_hash["Land reform"] = [  "15" ]
            sector_sdg_hash["Law"] = [  "16" ]
            sector_sdg_hash["Legal reform"] = [  "16" ]
            sector_sdg_hash["LGBTQ issues"] = [  "10" , "16" ]
            sector_sdg_hash["Livelihood"] = [  "8" , "12" , "15" ]
            sector_sdg_hash["Marine systems"] = [  "14" ]
            sector_sdg_hash["Markets"] = [  "8" , "17" ]
            sector_sdg_hash["Maternal newborn and child health"] = [  "2" , "3" ]
            sector_sdg_hash["Microfinance and microcredit"] = [  "1" , "17" , "8" , "9" ]
            sector_sdg_hash["Migration"] = [  "10" ]
            sector_sdg_hash["Mining"] = [  "11" , "12" , "13" , "15" ]
            sector_sdg_hash["Multi-stakeholder partnership"] = [  "17" ]
            sector_sdg_hash["Nationalism"] = [  "16" ]
            sector_sdg_hash["Natural resource management"] = [  "12" , "15" , "14" ]
            sector_sdg_hash["Nutrition"] = [  "2" ]
            sector_sdg_hash["Oceans"] = [  "14" ]
            sector_sdg_hash["Official development assistance"] = [  "10" , "17" ]
            sector_sdg_hash["Participation"] = [  "5" , "6" , "16" ]
            sector_sdg_hash["Partnership"] = [  "1" , "4" , "6" , "11" , "17" ]
            sector_sdg_hash["Peace and security"] = [ "16" ]
            sector_sdg_hash["Peacebuilding"] = [  "16" ]
            sector_sdg_hash["Peacekeeping"] = [  "16" ]
            sector_sdg_hash["Policy"] = [  "1" , "5" , "10" , "12" , "13" , "17" ]
            sector_sdg_hash["Policy analysis"] = [  "17" ]
            sector_sdg_hash["Political economy"] = [  "8" ]
            sector_sdg_hash["Politics"] = [  "17" ]
            sector_sdg_hash["Population policy"] = [  "11" ]
            sector_sdg_hash["Postcolonialism"] = [  "17" ]
            sector_sdg_hash["Poverty reduction"] = [  "1" ]
            sector_sdg_hash["Power"] = [  "5" , "10" ]
            sector_sdg_hash["Project management"] = [  "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10", "11" , "12" , "13" , "14" , "15" , "16" , "17" ]
            sector_sdg_hash["Public engagement"] = [  "12" , "6" ]
            sector_sdg_hash["Public sector policy"] = [ "5" ]
            sector_sdg_hash["Public-private partnerships"] = [ "17" ]
            sector_sdg_hash["Race"] = [  "10" ]
            sector_sdg_hash["Reconstruction (Humanitarian)"] = [  "3" , "4" ]
            sector_sdg_hash["Regional"] = [  "9" ]
            sector_sdg_hash["Religion and development"] = [ "3" , "4" , "5" ]
            sector_sdg_hash["Renewable energy"] = [  "7" ]
            sector_sdg_hash["Resilience"] = [  "1" , "13" , "9" ]
            sector_sdg_hash["Results-based management"] = [  "12" ]
            sector_sdg_hash["Rural development"] = [ "2" , "11" ]
            sector_sdg_hash["Sanitation and waste disposal"] = [  "6" , "11" , "12" ]
            sector_sdg_hash["Sexual and reproductive health and rights"] = [  "3" , "5" ]
            sector_sdg_hash["Shelter and housing"] = [ "11" ]
            sector_sdg_hash["Small and medium-sized enterprises (SME) development"] = [  "8" , "9" ]
            sector_sdg_hash["Social change"] = [  "12" , "15" ]
            sector_sdg_hash["Social development"] = [  "9" , "10" ]
            sector_sdg_hash["Social protection"] = [  "1" , "5" , "10" ]
            sector_sdg_hash["Social/welfare services"] = [  "1" , "5" ]
            sector_sdg_hash["South-south cooperation"] = [  "17" ]
            sector_sdg_hash["Sustainable development"] = [  "11" , "12" ]
            sector_sdg_hash["Sustainable Development Goals"] = [  "17" , "12" , "4" ]
            sector_sdg_hash["System change"] = [  "8" , "11" ]
            sector_sdg_hash["Taxation"] = [  "10" , "17" ]
            sector_sdg_hash["Technology"] = [  "7" , "9" ]
            sector_sdg_hash["The state"] = [  "16" , "17" ]
            sector_sdg_hash["Trade"] = [  "17" ]
            sector_sdg_hash["Transnationalism"] = [  "10" ]
            sector_sdg_hash["Transparency"] = [  "16" ]
            sector_sdg_hash["Urbanization and urban development"] = [  "11" ]
            sector_sdg_hash["Volunteerism"] = [ ]
            sector_sdg_hash["Water access and conservation"] = [  "6" ]
            sector_sdg_hash["Water sanitation and hygiene"] = [  "6" ]
            sector_sdg_hash["Women's rights"] = [  "1" , "3" , "8" , "13" ]
            sector_sdg_hash["Militarization"] = [  ]



			Profile.all.each_with_index do |profile,index|

				#puts "Name #{profile.firstname}"

				# For each profile
				# Get all of the sectors
				# For each sector
				# Go through the sectors
				# Add SVG based on the sectors that are available
				# If sector there add SVG
                #

				profile.sectors.all.each_with_index do |profile_sector,index_a|

                    if sector_sdg_hash.has_key?(profile_sector.english)

                        # Sector found
                        # Loop through each SDGs for one sector
                        sector_sdg_hash[profile_sector.english].each do |sdg_code|

							puts "SECTOR: #{profile_sector.english}"

							profile.sustainable_development_goals.each do |p_sdg|
								puts "Current SDGs: #{p_sdg.code}"
							end


							# Lets assume the SDG doesn't exist in the profile already
							sdg_exists_in_profile = false

							# Check to see if the SDG exists on the
							profile.sustainable_development_goals.each do |p_sdg|

								puts "CODES: #{p_sdg.code} #{sdg_code}"

								if p_sdg.code.to_s == sdg_code

									sdg_exists_in_profile = true

								end

							end

							# Check if the SDG is already added - no need to add it twice
							if sdg_exists_in_profile == false

								sdg = SustainableDevelopmentGoal.where( code: sdg_code)
								profile.sustainable_development_goals.push(sdg)

								puts "Added SDG #{sdg_code} to #{profile.firstname}"

							end

                            # puts "#{profile_sector.english} SDG CODE: #{sdg_code}"

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
