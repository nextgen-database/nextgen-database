class Admin::ResearchMethodsController < ApplicationController

	before_action :find_research_method, only: [:edit, :update, :show, :delete, :destroy]

	# Index action to render all Research Methods
	def index
		@research_methods = ResearchMethod.all
	end

	# New action for creating a new Research Methods
	def new
		@research_method = ResearchMethod.new
	end

	def edit
		#@sector = Sector.find(params[:id])
		# Before Action function is called
	end



	# Create function to save the Research Method into the DB
	def create

		@research_method = ResearchMethod.new(research_method_params)

   		if @research_method.save
      		flash[:notice] = "Successfully created post!"
      		redirect_to admin_research_methods_path
    	else
      		flash[:alert] = "Error creating new post!"
      		render :new
    	end
	end



	# Update action updates the post with the new information
	def update

		if @research_method.update_attributes(research_method_params)
		  flash[:notice] = "Successfully updated post!"
		  redirect_to admin_research_methods_path
		else
		  flash[:alert] = "Error updating post!"
		  render :edit
		end
	end

	# Destroy function to remove the sector from the DB
	def destroy

		if @research_method.destroy
			flash[:notice] = "Successfully deleted post!"
			redirect_to admin_research_methods_path
		else
			flash[:alert] = "Error updating post!"
		end
  	end


	# Private members and functions
	private

    	def research_method_params
			params.require(:research_method).permit(:english, :french)
		end

		def find_research_method
			@research_method = ResearchMethod.find(params[:id])
		end

end
