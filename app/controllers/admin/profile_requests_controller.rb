class Admin::ProfileRequestsController < ApplicationController


	# Create function to save the Research Method into the DB
	def create

		@profile_request = ProfileRequest.new(profile_request_params)

		# Set the user id from devise's user id
		# TODO: Check to see if the user is actually authenticated
		# 		 before doing anything
		@profile_request.user_id = current_user.id

		if @profile_request.save
			flash[:notice] = "Successfully created post!"
			redirect_to account_path
	 	else
			flash[:alert] = "Error creating new post!"
			redirect_to account_path
	  	end

	end

	# Update action updates the post with the new information
	def update

		@profile_request = ProfileRequest.find(params[:id])

		if @profile_request.update_attributes(profile_request_params)
		  flash[:notice] = "Successfully updated post!"
		  redirect_to account_path
		else
		  flash[:alert] = "Error updating post!"
		  redirect_to account_path
		end
	end


	private

    def profile_request_params
    	params.require(:profile_request).permit(:profile_id, :status)
	end

	def find_profile_request
		@profile_request = ProfileRequest.find(params[:id])
	end


end
