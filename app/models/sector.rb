class Sector < ApplicationRecord
	has_many :profile_sectors
	has_many :profiles, through: :profile_sectors
end
