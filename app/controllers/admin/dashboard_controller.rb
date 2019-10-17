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

	def user_management

		@users = User.order(:email).all.includes(:profile)

	end

	def vocabulary_management

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

end
