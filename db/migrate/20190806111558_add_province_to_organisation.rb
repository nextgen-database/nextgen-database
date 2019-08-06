class AddProvinceToOrganisation < ActiveRecord::Migration[5.2]
  	def change

		add_reference :organisations, :province, foreign_key: true

  	end
end
