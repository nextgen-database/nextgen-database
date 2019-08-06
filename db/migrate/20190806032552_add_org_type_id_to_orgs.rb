class AddOrgTypeIdToOrgs < ActiveRecord::Migration[5.2]
	def change

		add_reference :organisations, :organisation_type, foreign_key: true

	end
end
