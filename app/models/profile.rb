class Profile < ApplicationRecord

	has_many :profile_sectors
	has_many :sectors, through: :profile_sectors

	has_many :profile_demographics
	has_many :deographics, through: :profile_demographics

	has_many :profile_development_actors
	has_many :deographics, through: :profile_development_actors

end
