class User < ApplicationRecord

	# Setup two roles, user and admin
	enum role: [:user, :admin]

	# After creating a new account set the default role
	after_initialize :set_default_role, :if => :new_record?

	# The default role for a new user is "user"
	def set_default_role

		self.role ||= :user

	end

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	#devise :database_authenticatable, :registerable,
	#       :recoverable, :rememberable, :validatable

	devise :database_authenticatable, :lockable,
			:recoverable, :rememberable, :trackable, :validatable,
			:registerable, :confirmable

end
