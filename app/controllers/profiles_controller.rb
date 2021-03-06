class ProfilesController < ApplicationController

	# Include the Pagy Library for pagination
	# https://ddnexus.github.io/pagy/how-to
	include Pagy::Backend

	# Make sure a user is authenticated when adding a new profile
	#  and editing a profile
	# before_action :authenticate_user!, except: [ :index, :show ]

	def index

		# setup all of the search parameters and expose them to the view
		set_search_params()

		# call the profile controller search function that handles search
		# 	and filtering
		@profiles = search()

		# Paginate the search and filtered results
		@pagy, @profile_results = pagy_array(@profiles)

		# is advanced search being used? If so set a flag
		# this flag is used by the view to open the filters
		@is_advanced_filters_on = false
		@is_advanced_filters_on = true unless @search_parameters['advanced_search_flag'].blank?
		@is_advanced_filters_on = true unless @search_parameters['sector_ids'].blank?
		@is_advanced_filters_on = true unless @search_parameters['demographic_ids'].blank?
		@is_advanced_filters_on = true unless @search_parameters['development_actor_ids'].blank?
		@is_advanced_filters_on = true unless @search_parameters['country_ids'].blank?
		@is_advanced_filters_on = true unless @search_parameters['region_ids'].blank?
		@is_advanced_filters_on = true unless @search_parameters['subregion_ids'].blank?
		@is_advanced_filters_on = true unless @search_parameters['research_method_ids'].blank?
		@is_advanced_filters_on = true unless @search_parameters['organisation_ids'].blank?
		@is_advanced_filters_on = true unless @search_parameters['organisation_type_ids'].blank?
		@is_advanced_filters_on = true unless @search_parameters['province_ids'].blank?

		# Save the search data
		save_search_terms()

	end

	# New action for creating a new profile
	def new

		# Setup variables
		@user = nil
		@user_is_admin = false
		@admin_has_own_profile = false

		# Try to get the current user if he/she exists
		@user = current_user

		# As long as the user exists then we can create a new profile
		if @user

			# Expose whether the user is an admin or not
			@user_is_admin = @user.admin?

			# Check if a profile exists - if not send them back to account screen - unless they are admins

			# Check if the user is an admin or a regular user
			if @user_is_admin

				# The user is an admin

				# Admins can add new Profiles even if they have an existing profile
				# If an admin has a profile then they can optionaly assign
				# this new profile to their user account
				# or they can create a new profile not assigned to any user account
				#

				# Check if the admin has a profile already
				if Profile.exists?(user_id: @user.id)
					@admin_has_own_profile = true
				else
					@admin_has_own_profile = false
				end

			else

				# The user is a regular user

				# Check if a profile exists already
				if Profile.exists?(user_id: @user.id)

					# Load profile
					redirect_to edit_profile_path(Profile.find_by(user_id: @user.id).id)

				end

			end

			# Load a new profile
			@profile = Profile.new


		else

			# Not a valid user
			# Redirect to the home page
			redirect_to root_path

		end

	end

	# Show function to display a single profile from the DB
	def show

		if Profile.where(visible:true).exists?(params[:id])
			@profile = Profile.find(params[:id])
		end

	end

	# Show function to display a single profile from the DB
	def edit

		# Flag to tell the view if the profile exists or not
		@profile_exists = false

		# Flag to tell if it's the admins profile or someone else's
		@profile_belongs_to_admin = false

		# Set the current user
		@user = current_user

		# As long as the user exists then we can create a new profile
		if @user

			# Expose whether the user is an admin or not
			@user_is_admin = @user.admin?

			# Check if a profile exists - if not send them back to account screen - unless they are admins
			if Profile.exists?(params[:id])

				@profile_exists = true

			end

			# If you are an admin you have permission to edit any profile


			# If the user is an admin
			if @user_is_admin

				logger.debug "I AM AN ADMIN!"

				if Profile.exists?(params[:id])

					# Turn the profile exists flag on for the view
					@profile_exists = true

					# Load profile
					@profile = Profile.find(params[:id])

					if @profile.user_id == @user.id
						@profile_belongs_to_admin = true
					end

					logger.debug "User ID from profile_id: #{@profile.user_id}"
					logger.debug "params[:id]: #{params[:id]}"
					logger.debug "User ID: #{@user.id}"
					logger.debug "@profile_belongs_to_admin: #{@profile_belongs_to_admin}"

				end


			else

				# Do user things

				# Does a profile exist on the parameter profile ID
				if Profile.exists?(params[:id])

					# Does exactly one profile exist for this user
					@profile_ids_from_user_id = Profile.where(user_id: @user.id).pluck(:id)


					logger.debug "profile_ids_from_user_id: #{@profile_ids_from_user_id}"
					logger.debug "params[:id]: #{params[:id]}"

					# The array count for the profile ids should be 1
					#  If it isn't 1,
					#   either the user has too many profiles which
					#   shouldn't exist or
					#   the user doesn't have any profiles and ending up here by accident
					if @profile_ids_from_user_id.length == 1

						logger.debug "I am here: #{@profile_ids_from_user_id[0]}"

						# Great, we found one profile that belongs to a user
						# Does it match the current parameter ID?
						if params[:id].to_s == @profile_ids_from_user_id[0].to_s

							logger.debug "Now I am here: #{@profile_ids_from_user_id[0]}"

							# Load profile
							@profile = Profile.find_by(user_id: @user.id)

						else

							redirect_to account_path

						end

					else

						redirect_to account_path

					end

				else

					# No profile associated to the parameter ID
					# Redirec the user to the main account page.
					redirect_to account_path

				end

			end

		else

			redirect_to root_path

		end

	end


	# Create function to save the profile into the DB
	def create

		# Check if an authorised user is logged in

		# Set the current user
		@user = current_user

		# As long as the user exists then we can create a new profile
		if @user

			# Expose whether the user is an admin or not
			@user_is_admin = @user.admin?


			# Create the profile objects with the parameters that are passed in
			@profile = Profile.new(profile_params)

			# If the user is an admin
			if @user_is_admin

				# Get the boolean parameter on
				# whether or not to link this profile
				# to the admin profile
				if params[:admin_link_profile] == "true"

					@profile.user_id = current_user.id

				else

					@profile.user_id = nil

				end

			else

				# Add the current user id to the profile unless it's an admin
				# Then we need to know if the admin is adding a new profile
				@profile.user_id = current_user.id

			end

			if @profile.save
				flash[:notice] = "Successfully created post!"
				redirect_to account_path
			else
				flash[:alert] = "Error creating new post!"
				redirect_to new_profile_path
			end

		end

	end

	# Update_Visibility action only allows an admin to update the visibility of a profile
	def update_visibility
	
		# Set the current user
		@user = current_user

		# As long as the user exists then we can move forward
		if @user

			# Expose whether the user is an admin or not
			@user_is_admin = @user.admin?

			# If you are an admin you have permission to edit any profile
			if @user_is_admin

				logger.debug "params[:profile][:visible]: #{params[:profile][:visible]}"

				# Check if a profile exists - if not send them back to account screen - unless they are admins
				if Profile.exists?(params[:id])

					logger.debug "I AM HERE"

					if params[:profile][:visible] == 'true' || params[:profile][:visible] == 'false'
					
						logger.debug "NOW I AM HERE"

						@profile = Profile.find(params[:id])

						@profile.visible = params[:profile][:visible]

						if @profile.save
							flash[:notice] = "Successfully updateed visibility!"
							redirect_to admin_profile_management_path
						else
							flash[:alert] = "Error updating visibility!"
							redirect_to edit_profile_path
						end

					else
						
						redirect_to edit_profile_path

					end 
				
				else 

					redirect_to admin_profile_management_path

				end
			
			else
				
				redirect_to root_path

			end
		
		else

			redirect_to root_path

		end

		

	end 

	# Update action updates the post with the new information
	def update

		# Set the current user
		@user = current_user

		# Expose whether the user is an admin or not
		@user_is_admin = @user.admin?

		# How can we know if the admin is
		# updating their own or someone else's
		# does it even matter

		# Check that the user is an admin or that the user
		# owns the profile
		# Check if a profile exists - if not send them back to account screen - unless they are admins
		if Profile.exists?(params[:id])

			@profile_exists = true
			@profile = Profile.find(params[:id])

			if @user_is_admin || @user.id == Profile.find(params[:id]).user_id

				# Update profile
				if @profile.update_attributes(profile_params)
					flash[:notice] = "Successfully updated post!"

					if @user_is_admin

						# Is the admin user is working on their profile or someone elses
						#if @user.id == Profile.find(params[:id]).user_id
						#	redirect_to account_path
						#end

						# Send an admin user back to the profile management screen
						redirect_to admin_profile_management_path

					else

						# Send a regular user back to their account page
						redirect_to account_path

					end

				else
					flash[:alert] = "Error updating post!"
					redirect_to edit_profile_path
				end

			end

		end

	end



	# Private members and functions
	private

		# Search Function
		def search

			# Handle if the query is blank!

			results = Array.new()

			# Get all of the visible profiles
			profile_ids = Profile.where(visible: true).pluck(:id)

			# Filter the full array by Search Query
			profile_ids = Profile.filter_by_search_query(@search_parameters['query'], profile_ids) unless @search_parameters['query'].blank?

			# Filter the full array by Search Query
			# Add logic to check if other SDG filters are applied
			if !@search_parameters['primary_sdg'].blank?
				if !(@search_parameters['primary_sdg'].include?("0"))
					profile_ids = Profile.filter_by_primary_sdg(@search_parameters['primary_sdg'], profile_ids)
				end
			end

			# Filter by Sectors
			profile_ids = Profile.filter_by_sector_ids(@search_parameters['sector_ids'], profile_ids) unless @search_parameters['sector_ids'].blank?

			# Filter by Demographics
			profile_ids = Profile.filter_by_demographic_ids(@search_parameters['demographic_ids'], profile_ids) unless @search_parameters['demographic_ids'].blank?

			# Filter by Development Actors
			profile_ids = Profile.filter_by_development_actor_ids(@search_parameters['development_actor_ids'], profile_ids) unless @search_parameters['development_actor_ids'].blank?

			# Filter by Countries
			profile_ids = Profile.filter_by_country_ids(@search_parameters['country_ids'], profile_ids) unless @search_parameters['country_ids'].blank?

			# Filter by Regions
			profile_ids = Profile.filter_by_region_ids(@search_parameters['region_ids'], profile_ids) unless @search_parameters['region_ids'].blank?

			# Filter by Subregions
			profile_ids = Profile.filter_by_subregion_ids(@search_parameters['subregion_ids'], profile_ids) unless @search_parameters['subregion_ids'].blank?

			# Filter by Research Methods
			profile_ids = Profile.filter_by_research_method_ids(@search_parameters['research_method_ids'], profile_ids) unless @search_parameters['research_method_ids'].blank?

			# Filter by Organisations
			profile_ids = Profile.filter_by_organisation_ids(@search_parameters['organisation_ids'], profile_ids) unless @search_parameters['organisation_ids'].blank?

			# Filter by Organisation Types
			profile_ids = Profile.filter_by_organisation_type_ids(@search_parameters['organisation_type_ids'], profile_ids) unless @search_parameters['organisation_type_ids'].blank?

			# Filter by Provinces
			profile_ids = Profile.filter_by_province_ids(@search_parameters['province_ids'], profile_ids) unless @search_parameters['province_ids'].blank?

			# Find the Profiles by the filtered IDs
			results = Profile.find(profile_ids).sort! { |a,b| a.lastname.downcase <=> b.lastname.downcase }

		end


		# Set the search parameters to exposed values
		# so that the view can access them
		def set_search_params

			# Initialise an empty hash
			@search_parameters = Hash.new

			# Set the Query Value
			# TODO: Remove duplicate queries because the system isn't smart enough yet
			# 		use the 'uniq' function
			@search_parameters['query'] = params[:q].split unless params[:q].blank?

			# Set the First SDG Filter Value
			@search_parameters['primary_sdg'] = params[:a].split unless params[:a].blank?

			# Set the Sector IDs
			@search_parameters['sector_ids'] = params[:b] unless params[:b].blank?

			# Set the Demographic IDs
			@search_parameters['demographic_ids'] = params[:c] unless params[:c].blank?

			# Set the Development Actors IDs
			@search_parameters['development_actor_ids'] = params[:d] unless params[:d].blank?

			# Set the Country IDs
			@search_parameters['country_ids'] = params[:e] unless params[:e].blank?

			# Set the Region IDs
			@search_parameters['region_ids'] = params[:f] unless params[:f].blank?

			# Set the Subregion IDs
			@search_parameters['subregion_ids'] = params[:g] unless params[:g].blank?

			# Set the Research Method IDs
			@search_parameters['research_method_ids'] = params[:h] unless params[:h].blank?

			# Set the Organisations
			@search_parameters['organisation_ids'] = params[:i] unless params[:i].blank?

			# Set the Organisation TYpes
			@search_parameters['organisation_type_ids'] = params[:j] unless params[:j].blank?

			# Set the Province
			@search_parameters['province_ids'] = params[:k] unless params[:k].blank?

			# Set the Advanced Search Flag
			@search_parameters['advanced_search_flag'] = params[:z] unless params[:z].blank?

		end


		# Set the search parameters to exposed values
		# so that the view can access them
		def save_search_terms

			# Make a local copy of the search queries
			queries = @search_parameters['query']

			# Create a new Search Profile object
			sp = SearchProfile.new

			# Harmonse the query string by making it lowercase and joining the terms together seperated by a space
			queries.blank? ? term = nil : term = queries.join(' ').downcase

			# Add each search term to the current SearchProfile object
			sp.search_profile_term = SearchProfileTerm.find_or_create_by( term: term) 
			
			# Add the SDG filter information if used
			# nil = some sort of error or no data
			# 0 = all SDGs applied (DEFAULT)
			# 1-17 = one of the SDGs
			sdg_param = 0

			if !@search_parameters['primary_sdg'].blank?
				
				if !(@search_parameters['primary_sdg'].include?("0"))

					if SustainableDevelopmentGoal.exists?(@search_parameters['primary_sdg'][0].to_i)
					
						sdg_param = @search_parameters['primary_sdg'][0].to_i
					
					else

						sdg_param = nil

					end 

				end

			end

			# Save the sdg param filter
			sp.search_profile_sdg_param = sdg_param

			# Save the current SearchProfile object
			sp.save

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
				:twitter,
				:linkedin,
				:academia_edu,
				:prefix_id,
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
