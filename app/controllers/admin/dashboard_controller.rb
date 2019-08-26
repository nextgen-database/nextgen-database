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

	end

	def vocabulary_management

	end

	private

		def set_user

			# Expose the current user to the view
			@user = current_user

		end

end
