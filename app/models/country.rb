class Country < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_many :profile_countries
	has_many :profiles, through: :profile_countries
end
