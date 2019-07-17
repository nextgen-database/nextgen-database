class AddTwitterLinkedInAcademiaToProfiles < ActiveRecord::Migration[5.2]
	def change

		add_column 		:profiles, :twitter, :string
		add_column 		:profiles, :linkedin, :string
		add_column 		:profiles, :academia_edu, :string

	end
end
