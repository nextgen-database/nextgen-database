class Admin::OrganisationsController < ApplicationController

	before_action :find_organisation, only: [:edit, :update, :show, :delete, :destroy]

	# Index action to render all organisations
	def index
		@organisations = Organisation.order(:english).all
	end

	# New action for creating sector
	def new
		@organisation = Organisation.new
	end

	# Edit function to update the organisation into the DB
	def edit
		@organisation = Organisation.find(params[:id])
	end


	# Create function to save the organisation into the DB
	def create

		@organisation = Organisation.new(organisation_params)

   		if @organisation.save
      		flash[:notice] = "Successfully created post!"
      		redirect_to admin_organisations_path
    	else
      		flash[:alert] = "Error creating new post!"
      		render :new
    	end
	end


	# Update action updates the post with the new information
	def update
		if @organisation.update_attributes(organisation_params)
		  flash[:notice] = "Successfully updated post!"
		  redirect_to admin_organisations_path
		else
		  flash[:alert] = "Error updating post!"
		  render :edit
		end
	  end


	# Destroy function to remove the organisation from the DB
	def destroy

		#@organisation = Organisation.find(params[:id])

		if @organisation.destroy
			flash[:notice] = "Successfully deleted post!"
			redirect_to admin_organisations_path
		else
			flash[:alert] = "Error updating post!"
		end

	  end




	# Private members and functions
	private

    	def organisation_params
			params.require(:organisation).permit(:english, :french, :organisation_type_id, :province_id)
		end

		def find_organisation
			@organisation = Organisation.find(params[:id])
		end

end
