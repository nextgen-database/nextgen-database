class AddContactInformationToProfiles < ActiveRecord::Migration[5.2]
	def change

		add_column :profiles, :email, :string , :null => true
		add_column :profiles, :phone_number, :string, :null => true
		add_column :profiles, :website, :string, :null => true

	end
end
