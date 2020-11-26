class Admin::DashboardController < AdminController

	before_action :set_user

	def index

		# Expose the number of profiles in the databases
		@profile_count = Profile.count

		# Expose the number of users in the database
		@user_count = User.count

		# Expose the number of profiles that don't belong to a user
		@profile_orphaned_count = Profile.where(user: nil).count

		# Expose the number of profiles that belong to a user
		@profile_linked_count = @profile_count - @profile_orphaned_count

		# Expose the number of search results that occured in the last seven days
		@search_profile_stats_for_days = get_search_profile_data_for_days

		# Expose the search terms and stats for searches
		@search_profile_terms_data = get_search_profile_term_data

		# Expose the search terms and stats for searches
		@search_profile_sdg_data = get_search_profile_sdg_data


	end

	def profile_requests

		# Expose the Active Profile Requests
		@profile_requests_active = ProfileRequest.where(status: "not_set").order(:updated_at)

		# Expose the past profile requests
		@profile_requests_not_active = ProfileRequest.where.not(status: "not_set").order(updated_at: :desc)

	end

	def profile_management

		@profiles = Profile.order(:lastname).all.includes( affiliations: [ :organisation]).includes(:prefix)

	end

	def profile_output 

		@profiles = Profile.order(:lastname).all.includes( affiliations: [ :organisation]).includes(:prefix)

		respond_to do |format|
			format.html
			format.csv { send_data @profiles.to_csv }
		end

	end 

	def user_management

		@users = User.order(:email).all.includes(:profile)

	end

	def user_output 

		@users = User.order(:email).all.includes(:profile)

		respond_to do |format|
			format.html
			format.csv { send_data @users.to_csv }
		end

	end 

	def vocabulary_management

	end

	def content_management

		# The content about table only has 
		# one entry so that's why we 
		# grab the first one
		@content_about = ContentAbout.first

	end

	private

		def set_user

			# Expose the current user to the view
			@user = current_user

		end

		def get_search_profile_data_for_days

			search_profile_statistics = Hash.new

			# Hashes keep the order in which they are stored
			# Since we present the data from oldest to newest I'm putting them in oldest to newest
			search_profile_statistics[6.day.ago.strftime("%A")] = SearchProfile.where("DATE(created_at) = ?", 6.days.ago).count
			search_profile_statistics[5.day.ago.strftime("%A")] = SearchProfile.where("DATE(created_at) = ?", 5.days.ago).count
			search_profile_statistics[4.day.ago.strftime("%A")] = SearchProfile.where("DATE(created_at) = ?", 4.days.ago).count
			search_profile_statistics[3.day.ago.strftime("%A")] = SearchProfile.where("DATE(created_at) = ?", 3.days.ago).count
			search_profile_statistics[2.day.ago.strftime("%A")] = SearchProfile.where("DATE(created_at) = ?", 2.days.ago).count
			search_profile_statistics[1.day.ago.strftime("%A")] = SearchProfile.where("DATE(created_at) = ?", 1.days.ago).count
			search_profile_statistics["Today"] = SearchProfile.where("DATE(created_at) = ?", 0.days.ago).count

			search_profile_statistics

		end

		def get_search_profile_term_data

			search_profile_term_statistics = Array.new

			# Hashes keep the order in which they are stored
			# Since we present the data from oldest to newest I'm putting them in oldest to newest

			search_profile_term_statistics = SearchProfileTerm.connection.select_all(
				"SELECT
					search_profile_terms.term, count(*)
				FROM
				   	search_profile_terms  
				LEFT OUTER JOIN
				   	search_profiles ON search_profiles.search_profile_term_id = search_profile_terms.id
				GROUP BY search_profile_terms.term
				ORDER BY count desc").to_a

			search_profile_term_statistics

		end

		def get_search_profile_sdg_data

			search_profile_sdg_statistics = Array.new
			
			# Hashes keep the order in which they are stored
			# Since we present the data from oldest to newest I'm putting them in oldest to newest

			# We want the data to be: 
			# Null [Null]: AAA
			# ALL [0]: XXX
			# SDG 1 [1]: YYY
			# SDG 2 [2]: ZZZ

			search_profile_sdg_statistics = SearchProfile.connection.select_all(
				"SELECT search_profiles.search_profile_sdg_param, sustainable_development_goals.banner_en , count(*)
				FROM  search_profiles
					left join sustainable_development_goals
					on search_profiles.search_profile_sdg_param = sustainable_development_goals.id 
				GROUP by search_profiles.search_profile_sdg_param, sustainable_development_goals.banner_en 
				ORDER by count desc").to_a
			
			# Clean up the array by adding in "friendly" labels for error and all sdgs
			search_profile_sdg_statistics.each_with_index do |sdg,index|
				
				if sdg["search_profile_sdg_param"] == 0
					
					sdg["banner_en"] = "All SDGs"

				elsif sdg["search_profile_sdg_param"] == nil

					sdg["banner_en"] = "Search Error"

				end

			end 
 			
			search_profile_sdg_statistics

		end

end
