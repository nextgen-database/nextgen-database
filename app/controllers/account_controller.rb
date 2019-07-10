class AccountController < ApplicationController
	before_action :authenticate_user!
	#before_action :owned_profile, only: [:edit, :update]



	def show

		@user=current_user

		# We need to tell the view what to do with the profile
		# If a profile exists then display some profile information
		# If a profile doesn't exist then display a message saying to click the edit button to add a new profile

		# Does a valid profile exist on the user?

	end



	def edit

	end

	def user_params
		# NOTE: Using `strong_parameters` gem
		params.require(:user).permit(:password, :password_confirmation)
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
