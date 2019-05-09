class Demographic < ApplicationRecord
	has_many :profile_demographics
	has_many :profiles, through: :profile_demographics
end
