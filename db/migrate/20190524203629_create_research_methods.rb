class CreateResearchMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :research_methods do |t|

		t.string :english, :null => false
    	t.string :french,  :null => false

    	t.timestamps
    end
  end
end
