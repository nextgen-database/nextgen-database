class CreateOrganisationTypes < ActiveRecord::Migration[5.2]
	def change
		create_table :organisation_types do |t|

			t.string :english
      		t.string :french

      		t.timestamps
		end
  	end
end
