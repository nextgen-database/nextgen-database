class CreateProvinces < ActiveRecord::Migration[5.2]
  	def change
   		create_table :provinces do |t|

			t.string :english
			t.string :french

			t.timestamps

    	end
  	end
end
