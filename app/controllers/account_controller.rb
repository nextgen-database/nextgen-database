class AccountController < ApplicationController
	before_action :authenticate_user!
	#before_action :owned_profile, only: [:edit, :update]



	def index

		@user=current_user

		# We need to tell the view what to do with the profile
		# If a profile exists then display some profile information
		# If a profile doesn't exist then display a message saying to click the edit button to add a new profile

		# Does a valid profile exist on the user?
		@valid_profile = Profile.exists?(user_id: @user.id)

		if @valid_profile

			@user_profile = Profile.find_by(user_id: @user.id)

		end

	end



	def edit_profile

		# Set the current user
		@user = current_user

		# Expose whether the user is an admin or not
		@userisadmin = @user.admin?

		# Check if a profile exists - if not send them back to account screen - unless they are admins

		# If the user is an admin
		if @userisadmin

			# Do admin things

		else

			# Do user things

			# Check if a profile exists already
			if Profile.exists?(user_id: @user.id)

				# Load profile
				@user_profile = Profile.find_by(user_id: @user.id)

			else
				# No profile associated to the account - you shouldn't
				#  be on the edit profiles page.
				# Redirec the user to the main account page.
				redirect_to account_path

			end

		end






	end


	def user_params
		# NOTE: Using `strong_parameters` gem
		params.require(:user).permit(:email, :password, :password_confirmation, :current_password)

	end

	def update

		@user = current_user
		if update_resource(@user, user_params)
		  # Sign in the user by passing validation in case their password changed
		  #bypass_sign_in(@user)
		  redirect_to root_path
		else
		  render "edit"
		end

	end




	#def owned_profile
#
#		unless current_user == @user
#
#		  flash[:alert] = "That profile doesn't belong to you!"
#
#		  redirect_to root_path
#
#		end
#
#	  end

end
