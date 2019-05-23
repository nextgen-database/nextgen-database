class Admin::DemographicsController < ApplicationController

	before_action :find_demographic, only: [:edit, :update, :show, :delete, :destroy]

	# Index action to render all Demographic
	def index
		@demographics = Demographic.all
	end

	# New action for creating Demographic
	def new
		@demographic = Demographic.new
	end

	def edit
		#@sector = Sector.find(params[:id])
	end


	# Create function to save the sector into the DB
	def create

		@demographic = Demographic.new(demographic_params)

   		if @demographic.save
      		flash[:notice] = "Successfully created post!"
      		redirect_to admin_demographics_path
    	else
      		flash[:alert] = "Error creating new post!"
      		render :new
    	end
	end

	# Edit function to update the demographic into the DB

	# Update action updates the post with the new information
	def update
		if @demographic.update_attributes(demographic_params)
		  flash[:notice] = "Successfully updated post!"
		  redirect_to admin_demographics_path
		else
		  flash[:alert] = "Error updating post!"
		  render :edit
		end
	  end

	# Destroy function to remove the sector from the DB
	def destroy

		#@sector = Sector.find(params[:id])

		if @demographic.destroy
			flash[:notice] = "Successfully deleted post!"
			redirect_to admin_demographics_path
		else
			flash[:alert] = "Error updating post!"
		end

	  end




	# Private members and functions
	private

    	def demographic_params
			params.require(:demographic).permit(:english, :french)
		end

		def find_demographic
			@demographic = Demographic.find(params[:id])
		end

end
