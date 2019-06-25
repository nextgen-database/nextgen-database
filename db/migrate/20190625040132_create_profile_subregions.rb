class CreateProfileSubregions < ActiveRecord::Migration[5.2]
	def change
		create_table :profile_subregions do |t|

			t.integer :profile_id
			t.integer :subregion_id

			t.timestamps

		end
	end
end
