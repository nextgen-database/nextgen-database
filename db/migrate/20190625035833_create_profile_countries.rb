class CreateProfileCountries < ActiveRecord::Migration[5.2]
	def change
		create_table :profile_countries do |t|

				t.integer :profile_id
				t.integer :country_id

				t.timestamps

		end
	end
end
