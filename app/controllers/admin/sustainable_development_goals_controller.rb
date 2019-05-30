class Admin::SustainableDevelopmentGoalsController < ApplicationController

	before_action :find_sustainable_development_goal, only: [:edit, :update, :show, :delete, :destroy]

	# Index action to render all Sustainable Development Goals
	def index
		@sustainable_development_goals = SustainableDevelopmentGoal.all
	end

	# New action for creating a new Sustainable Development Goal
	def new
		@sustainable_development_goal = SustainableDevelopmentGoal.new
	end

	# Edit function to update the Sustainable Development Goal into the DB
	def edit
		#@title = Title.find(params[:id])
	end


	# Create function to save the Sustainable Development Goal into the DB
	def create

		@sustainable_development_goal = SustainableDevelopmentGoal.new(sustainable_development_goal_params)

   		if @sustainable_development_goal.save
      		flash[:notice] = "Successfully created post!"
      		redirect_to admin_sustainable_development_goals_path
    	else
      		flash[:alert] = "Error creating new post!"
      		render :new
    	end
	end


	# Update action updates the Sustainable Development Goal with the new information
	def update
		if @sustainable_development_goal.update_attributes(title_params)
		  flash[:notice] = "Successfully updated post!"
		  redirect_to admin_sustainable_development_goals_path
		else
		  flash[:alert] = "Error updating post!"
		  render :edit
		end
	  end


	# Destroy function to remove the Sustainable Development Goal from the DB
	def destroy

		#@title = Title.find(params[:id])

		if @sustainable_development_goal.destroy
			flash[:notice] = "Successfully deleted post!"
			redirect_to admin_sustainable_development_goals_path
		else
			flash[:alert] = "Error updating post!"
		end

	  end




	# Private members and functions
	private

    	def sustainable_development_goal_params
			params.require(:title).permit(:code, :title_en, :title_fr, :description_en, :description_fr)
		end

		def find_sustainable_development_goal
			@sustainable_development_goal = SustainableDevelopmentGoal.find(params[:id])
		end

end
