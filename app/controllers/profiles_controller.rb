class ProfilesController < ApplicationController

	def index

		# setup all of the search parameters and expose them to the view
		set_search_params()

		# call the profile controller search function that handles search
		# 	and filtering
		@profiles = search()

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

		# Search Function
		def search

			# Handle if the query is blank!

			results = Array.new()

			# Get all of the profiles
			profile_ids = Profile.pluck(:id)

			# Filter the full array by Search Query
			profile_ids = Profile.filter_by_search_query(@search_parameters['query'], profile_ids) unless @search_parameters['query'].blank?

			# Filter the full array by Search Query
			# Add logic to check if other SDG filters are applied
			if !@search_parameters['primary_sdg'].blank?
				if !(@search_parameters['primary_sdg'].include?("0"))
					profile_ids = Profile.filter_by_primary_sdg(@search_parameters['primary_sdg'], profile_ids)
				end
			end

			# Eventually Add other filters here
			# ...

			# Find the Profiles by the filtered IDs
			results = Profile.find(profile_ids)

		end


		# Set the search parameters to exposed values
		# so that the view can access them
		def set_search_params

			# Initialise an empty hash
			@search_parameters = Hash.new

			# Set the Query Value
			@search_parameters['query'] = params[:q].split unless params[:q].blank?

			# Set the First SDG Filter Value
			@search_parameters['primary_sdg'] = params[:a].split unless params[:a].blank?

		end


		# A list of the param names that can be used for filtering the Product list
		def filtering_params(params)
			params.slice(
				:s,
				:location,
				:starts_with)
		end

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
