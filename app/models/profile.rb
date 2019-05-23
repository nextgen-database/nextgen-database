class Profile < ApplicationRecord

	validates :firstname, presence: true

	has_many :profile_sectors
	has_many :sectors, through: :profile_sectors

	has_many :profile_demographics
	has_many :demographics, through: :profile_demographics

	has_many :profile_development_actors
	has_many :development_actors, through: :profile_development_actors

end
