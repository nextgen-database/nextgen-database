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




			# Display all of the person ids
			#width = profile_keys.flatten.max.to_s.size+2
				#=> 4
			#puts profile_keys.map { |a| a.map { |i| i.to_s.rjust(width) }.join }

			puts "END..."

		end
	end
end
