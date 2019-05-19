class Admin::SectorsController < ApplicationController

	before_action :find_sector, only: [:edit, :update, :show, :delete, :destroy]

	# Index action to render all sectors
	def index
		@sectors = Sector.all
	end

	# New action for creating sector
	def new
		@sector = Sector.new
	end

	def edit
		#@sector = Sector.find(params[:id])
	end


	# Create function to save the sector into the DB
	def create

		@sector = Sector.new(sector_params)

   		if @sector.save
      		flash[:notice] = "Successfully created post!"
      		redirect_to admin_sectors_path
    	else
      		flash[:alert] = "Error creating new post!"
      		render :new
    	end
	end

	# Edit function to update the sector into the DB

	# Update action updates the post with the new information
	def update
		if @sector.update_attributes(sector_params)
		  flash[:notice] = "Successfully updated post!"
		  redirect_to admin_sectors_path
		else
		  flash[:alert] = "Error updating post!"
		  render :edit
		end
	  end

	# Destroy function to remove the sector from the DB
	def destroy

		#@sector = Sector.find(params[:id])

		if @sector.destroy
			flash[:notice] = "Successfully deleted post!"
			redirect_to admin_sectors_path
		else
			flash[:alert] = "Error updating post!"
		end

	  end




	# Private members and functions
	private

    	def sector_params
			params.require(:sector).permit(:english, :french)
		end

		def find_sector
			@sector = Sector.find(params[:id])
		end

end
