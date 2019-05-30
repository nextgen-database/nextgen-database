class FixColumnNamesForSdgTable < ActiveRecord::Migration[5.2]
  	def change
		change_table :sustainable_development_goals do |t|

			t.rename :goal, :code
			t.rename :short_description_en, :title_en
			t.rename :short_description_fr, :title_fr

		end
  	end
end
