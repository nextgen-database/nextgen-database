class CreateOrganisations < ActiveRecord::Migration[5.2]
	def change
		create_table :organisations do |t|

			t.string :english, 	:null => false
      		t.string :french, 	:null => false

      		t.timestamps
    	end
  	end
end
