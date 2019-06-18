class AddShortTitlesToSustainableDevelopmentGoals < ActiveRecord::Migration[5.2]

	def change

		add_column :sustainable_development_goals, :banner_en, :string , :null => false
		add_column :sustainable_development_goals, :banner_fr, :string , :null => false

	end
end
