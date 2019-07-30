class Admin::ProfileRequestsController < ApplicationController


	# Create function to save the new Profile Request into the DB
	def create

		profile_request = ProfileRequest.new(profile_request_params)

		# Set the user id from devise's user id
		# TODO: Check to see if the user is actually authenticated
		# 		 before doing anything

		# TODO: Check that the current user is valid

		profile_request.user_id = current_user.id

		# Set the profile id that the user wants to tie to
		#profile_request.profile_id = params[:profile_id]

		if profile_request.save
			flash[:notice] = "Successfully created post!"
			logger.debug "SUCCESS: #{params.inspect}"

			redirect_to account_path
	 	else
			flash[:alert] = "Error creating new post!"
			logger.debug "ERROR: #{params.inspect}"

			redirect_to account_path
	  	end

	end

	# Update action updates the Profile Request with the new information
	def update


		# Get the current user
		user = current_user

		# Find the Profile Request
		profile_request = ProfileRequest.find(params[:id])

		if request_approved

			logger.debug "APPROVED ADMIN UPDATE PROFILE REQUESTS: #{params.inspect}"

			# Check that the current user is an admin
			if user.admin?

				logger.debug "USER IS ADMIN: #{user.inspect}"

				# Check that the profile requested does not below to anyone already
				if profile_request.status == "not_set"

					# Update the Profile by tying it to the user
					if Profile.find_by(id: profile_request.profile_id).user_id.blank?

						logger.debug "PROFILE USER ID is blank: #{Profile.find_by(id: profile_request.profile_id).user_id}"

						profile = Profile.find_by(id: profile_request.profile_id)
						profile.user_id = profile_request.user_id

						if profile.save
							flash[:notice] = "Successfully updated profile!"

							profile_request.approver_id = user.id
							profile_request.status = "approved"

							# Save the profile request
							profile_request.save

						else
							flash[:alert] = "Error updating post!"

						end

					else

						logger.debug "PROFILE USER ID is not blank: #{Profile.find_by(id: profile_request.profile_id).user_id}"

					end
					# If the above succeeds then mark this profile request as completed

				else

					logger.debug "THE PROFILE REQUEST IS NOT IN THE NOT SET STATE: #{profile_request.inspect}"

				end


			else

				logger.debug "USER IS NOT AN ADMIN: #{user.inspect}"

			end




			redirect_to admin_profile_requests_path

		elsif request_rejected

			logger.debug "REJECTED ADMIN UPDATE PROFILE REQUESTS: #{params.inspect}"

			# Check that the current user is an admin
			if user.admin?

				logger.debug "USER IS ADMIN: #{user.inspect}"

				# Check that the profile request is set to not_set and that its not some other status
				if profile_request.status == "not_set"

					profile_request.approver_id = user.id
					profile_request.status = "denied"

					# Save the profile request
					if profile_request.save
						flash[:notice] = "Successfully updated profile request!"
					else
						flash[:alert] = "Error updating profile request!"
					end

				else

					logger.debug "THE PROFILE REQUEST IS NOT IN THE NOT SET STATE: #{profile_request.inspect}"

				end


			else

				logger.debug "USER IS NOT AN ADMIN: #{user.inspect}"

			end

			redirect_to admin_profile_requests_path

		# User is updating the profile request by cancelling it from
		# their my account
		else


			logger.debug "REGULAR UPDATE PROFILE REQUESTS: #{params.inspect}"

			if profile_request.update_attributes(profile_request_params)
				flash[:notice] = "Successfully updated post!"
				redirect_to account_path
			else
				flash[:alert] = "Error updating post!"
				redirect_to account_path
			end



		end




	end


	private

    def profile_request_params
    	params.require(:profile_request).permit(:profile_id, :status)
	end

	def find_profile_request
		@profile_request = ProfileRequest.find(params[:id])
	end

	def request_approved

		if !params[:approve].blank?
			true
		else
			false
		end

	end

	def request_rejected

		if !params[:reject].blank?
			true
		else
			false
		end

	end

end
