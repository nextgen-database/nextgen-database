class AdminController < ApplicationController

	# all child controllers will automatically enforce access to admins only
	before_action :authenticate_user!
	before_action :require_admin

	def require_admin

		# Add logic later to check
		# with Devise if the user
		# is a type admin
		#
	  	unless current_user.admin?
			redirect_to root_path
		end
	end
end
