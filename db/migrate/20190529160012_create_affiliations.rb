class CreateAffiliations < ActiveRecord::Migration[5.2]
	def change
    	create_table :affiliations do |t|

			t.references :profile, foreign_key: true
			t.references :organisation, foreign_key: true

      		t.timestamps

		end
  	end
end
