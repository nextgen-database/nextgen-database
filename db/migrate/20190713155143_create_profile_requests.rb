class CreateProfileRequests < ActiveRecord::Migration[5.2]
	def change
		create_table :profile_requests do |t|

			t.belongs_to :user, null: false, index: true, foreign_key: true
			t.belongs_to :profile, null: false, index: true, foreign_key: true
			t.integer :status, default: 0, index: true
			t.integer :approver_id

			t.timestamps
		end
	end
end
