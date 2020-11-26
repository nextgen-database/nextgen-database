class Admin::ContentAboutController < ApplicationController

    before_action :find_content_about, only: [:index, :update]

    # Index action to render all sectors
	def index
        
    end
    
    # Update action updates the post with the new information
    def update
        if @about_content.update_attributes(content_about_params)
        flash[:notice] = "Successfully updated post!"
        redirect_to admin_content_about_index_path
        else
        flash[:alert] = "Error updating post!"
        render :edit
        end
    end


    # Private members and functions
	private

    def content_about_params
        params.require(:content_about).permit(:english, :french)
    end

    def find_content_about
        @about_content = ContentAbout.first
    end

end