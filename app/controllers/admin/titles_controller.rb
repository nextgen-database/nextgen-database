class Admin::TitlesController < ApplicationController

	before_action :find_title, only: [:edit, :update, :show, :delete, :destroy]

	# Index action to render all titles
	def index
		@titles = Title.all
	end

	# New action for creating sector
	def new
		@title = Title.new
	end

	# Edit function to update the title into the DB
	def edit
		#@title = Title.find(params[:id])
	end


	# Create function to save the title into the DB
	def create

		@title = Title.new(title_params)

   		if @title.save
      		flash[:notice] = "Successfully created post!"
      		redirect_to admin_titles_path
    	else
      		flash[:alert] = "Error creating new post!"
      		render :new
    	end
	end


	# Update action updates the post with the new information
	def update
		if @title.update_attributes(title_params)
		  flash[:notice] = "Successfully updated post!"
		  redirect_to admin_titles_path
		else
		  flash[:alert] = "Error updating post!"
		  render :edit
		end
	  end


	# Destroy function to remove the title from the DB
	def destroy

		#@title = Title.find(params[:id])

		if @title.destroy
			flash[:notice] = "Successfully deleted post!"
			redirect_to admin_titles_path
		else
			flash[:alert] = "Error updating post!"
		end

	  end




	# Private members and functions
	private

    	def title_params
			params.require(:title).permit(:english, :french)
		end

		def find_title
			@title = Title.find(params[:id])
		end

end
