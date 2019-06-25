class CreateCountries < ActiveRecord::Migration[5.2]
  	def change
		create_table :countries do |t|
			t.string :english, :null => false
			t.string :french,  :null => false

			t.timestamps

		end
  	end
end
