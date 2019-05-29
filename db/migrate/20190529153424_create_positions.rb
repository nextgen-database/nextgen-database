class CreatePositions < ActiveRecord::Migration[5.2]
	def change
    	create_table :positions do |t|

			t.string :department_en
      		t.string :department_fr
      		t.string :faculty_en
			t.string :faculty_fr
      		t.references :title, foreign_key: true

      		t.timestamps
    	end
  	end
end
