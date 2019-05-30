class CreateProfileSustainableDevelopmentGoals < ActiveRecord::Migration[5.2]
  	def change
    	create_table :profile_sustainable_development_goals do |t|

			t.belongs_to :profile, index: {:name => "idx_psdg_profile"}, foreign_key: true
			t.belongs_to :sustainable_development_goal, index: {:name => "idx_psdg_sdg"}, foreign_key: true

      		t.timestamps

		end
	end
end
