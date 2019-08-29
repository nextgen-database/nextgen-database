class CreateSearchProfiles < ActiveRecord::Migration[5.2]
	def change

		create_table :search_profiles do |t|

			t.integer :search_profile_term_id

			t.timestamps

		end

		create_table :search_profile_terms do |t|

			t.string :term

			t.index :term, unique: true

			t.timestamps

		end
	end
end
