class AddPrefixToProfiles < ActiveRecord::Migration[5.2]
	def change

		add_reference :profiles, :prefix, foreign_key: true

	end
end
