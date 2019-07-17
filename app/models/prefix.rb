class Prefix < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_many :profile_prefixes
	has_many :profiles, through: :profile_prefixes

end
