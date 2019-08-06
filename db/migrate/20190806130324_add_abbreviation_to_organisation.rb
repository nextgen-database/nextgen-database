class AddAbbreviationToOrganisation < ActiveRecord::Migration[5.2]

	def change

    	add_column :organisations, :abbreviation_en, :string
    	add_column :organisations, :abbreviation_fr, :string

	end

end
