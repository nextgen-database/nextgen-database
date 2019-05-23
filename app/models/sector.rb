class Sector < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_many :profile_sectors
	has_many :profiles, through: :profile_sectors
end
