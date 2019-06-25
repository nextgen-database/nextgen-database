class ProfilesController < ApplicationController

	def index
		#Get all of the profiles from the database
		@profiles = Profile.all
	end

	# New action for creating a new profile
	def new

		@profile = Profile.new

	end

	# Show function to display a single profile from the DB
	def show

		if Profile.exists?(params[:id])
			@profile = Profile.find(params[:id])
		end

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
				:email,
				:phone_number,
				:website,
				sector_ids:[],
				demographic_ids:[],
				development_actor_ids:[],
				research_method_ids:[],
				sustainable_development_goal_ids:[],
				country_ids:[],
				subregion_ids:[],
				region_ids:[],
				affiliations_attributes: [:id, :organisation_id, :_destroy,
					positions_attributes: [:id, :title_id, :department_en, :department_fr, :faculty_en, :faculty_fr, :_destroy],
					affiliation_positions: [:id, :organisation_id, :position_id, :_destroy]
				])
		end

end
