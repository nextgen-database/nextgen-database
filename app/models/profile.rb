class Profile < ApplicationRecord
	has_many :profile_sectors
	has_many :sectors, through: :profile_sectors
end
