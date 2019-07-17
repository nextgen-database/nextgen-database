class CreateProfilePrefixes < ActiveRecord::Migration[5.2]
	def change
		create_table :profile_prefixes do |t|

			t.integer :profile_id
			t.integer :prefix_id

			t.timestamps

		end
	end
end
