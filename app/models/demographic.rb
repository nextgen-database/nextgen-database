class Demographic < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_many :profile_demographics
	has_many :profiles, through: :profile_demographics
end
