class Organisation < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_one :affiliation

	belongs_to :organisation_type, optional: true
	belongs_to :province, optional: true

end
