class CreateProfileRegions < ActiveRecord::Migration[5.2]
	def change
		create_table :profile_regions do |t|

			t.integer :profile_id
			t.integer :region_id

			t.timestamps

		end
	end
end
