class CreateAffiliationPositions < ActiveRecord::Migration[5.2]
	def change
    	create_table :affiliation_positions do |t|

			t.belongs_to :affiliation, index: true
			t.belongs_to :position, index: true

      		t.timestamps

		end
  	end
end
