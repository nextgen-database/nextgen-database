class Admin::DashboardController < AdminController

	before_action :set_user

	def index



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
