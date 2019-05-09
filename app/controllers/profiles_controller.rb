class ProfilesController < ApplicationController

	def index
		#Get all of the profiles from the database
		@profiles = Profile.all
	end

end
