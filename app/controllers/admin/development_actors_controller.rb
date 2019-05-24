class Admin::DevelopmentActorsController < ApplicationController

	before_action :find_development_actor, only: [:edit, :update, :show, :delete, :destroy]

	# Index action to render all Development Actors
	def index
		@development_actors = DevelopmentActor.all
	end

	# New action for creating sector
	def new
		@development_actor = DevelopmentActor.new
	end

	def edit
		#@sector = Sector.find(params[:id])
	end


	# Create function to save the sector into the DB
	def create

		@development_actor = DevelopmentActor.new(development_actor_params)

   		if @development_actor.save
      		flash[:notice] = "Successfully created post!"
      		redirect_to admin_development_actors_path
    	else
      		flash[:alert] = "Error creating new post!"
      		render :new
    	end
	end

	# Edit function to update the sector into the DB

	# Update action updates the post with the new information
	def update
		if @development_actor.update_attributes(development_actor_params)
		  flash[:notice] = "Successfully updated post!"
		  redirect_to admin_development_actors_path
		else
		  flash[:alert] = "Error updating post!"
		  render :edit
		end
	  end

	# Destroy function to remove the sector from the DB
	def destroy

		#@sector = Sector.find(params[:id])

		if @development_actor.destroy
			flash[:notice] = "Successfully deleted post!"
			redirect_to admin_development_actors_path
		else
			flash[:alert] = "Error updating post!"
		end

	  end




	# Private members and functions
	private

    	def development_actor_params
			params.require(:development_actor).permit(:english, :french)
		end

		def find_development_actor
			@development_actor = DevelopmentActor.find(params[:id])
		end

end
