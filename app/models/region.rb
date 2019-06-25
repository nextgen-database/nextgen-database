class Region < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_many :profile_regions
	has_many :profiles, through: :profile_regions
end
