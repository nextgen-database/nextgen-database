class StaticPagesController < ApplicationController

	def home
	end

	def about

		@about_content = ContentAbout.first

	end

end
