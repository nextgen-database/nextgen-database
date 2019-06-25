class Country < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_many :profile_subregions
	has_many :profiles, through: :profile_subregions
end
