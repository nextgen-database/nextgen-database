class ProfilesController < ApplicationController

	def index
		#Get all of the profiles from the database
		@profiles = Profile.all
	end

	# New action for creating a new profile
	def new

		@profile = Profile.new

	end



	# Create function to save the sector into the DB
	def create

		@profile = Profile.new(profile_params)

   		if @profile.save
      		flash[:notice] = "Successfully created post!"
      		redirect_to profiles_path
    	else
      		flash[:alert] = "Error creating new post!"
      		render :new
    	end
	end



	# Private members and functions
	private

    	def profile_params
			params.require(:profile).permit(
				:firstname,
				:middlename,
				:lastname,
				sector_ids:[],
				demographic_ids:[],
				development_actor_ids:[], )
		end

end
