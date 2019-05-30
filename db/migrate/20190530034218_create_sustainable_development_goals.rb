class CreateSustainableDevelopmentGoals < ActiveRecord::Migration[5.2]
  	def change
    	create_table :sustainable_development_goals do |t|

			t.integer :goal, limit: 2, 		:null => false
			t.string :short_description_en, 	:null => false
			t.string :short_description_fr,	:null => false
			t.string :description_en, 		:null => false
			t.string :description_fr, 		:null => false

			t.timestamps
    	end
  	end
end
