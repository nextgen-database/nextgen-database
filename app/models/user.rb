class User < ApplicationRecord

	has_one :profile
	has_many :profile_requests, dependent: :destroy
	has_many :profile_approvals, class_name: 'ProfileRequest', inverse_of: 'approver', dependent: :destroy

	# Setup two roles, user and admin
	enum role: { user: 0, admin: 1 }

	# After creating a new account set the default role
	after_initialize :set_default_role, :if => :new_record?

	# The default role for a new user is "user"
	def set_default_role

		self.role ||= :user

	end

	# Export to CSV in the admin section
	def self.to_csv
		
		CSV.generate do |csv|
			csv << column_names
			all.each do |result|
			  csv << result.attributes.values_at(*column_names)
			end
		end
	
	end


	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	#devise :database_authenticatable, :registerable,
	#       :recoverable, :rememberable, :validatable
	devise :database_authenticatable, :lockable,
			:recoverable, :rememberable, :trackable, :validatable,
			:registerable, :confirmable

end
