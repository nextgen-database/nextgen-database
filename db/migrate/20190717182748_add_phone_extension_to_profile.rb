class AddPhoneExtensionToProfile < ActiveRecord::Migration[5.2]
	def change
		add_column :profiles, :phone_ext, :string
	end
end
