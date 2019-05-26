class CreateProfileResearchMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_research_methods do |t|

		t.integer :profile_id
		t.integer :research_method_id

		t.timestamps
    end
  end
end
