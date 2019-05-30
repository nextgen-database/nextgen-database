class Organisation < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_one :affiliation
end
