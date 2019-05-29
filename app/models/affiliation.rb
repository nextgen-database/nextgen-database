class Affiliation < ApplicationRecord

	belongs_to :organisation
	belongs_to :profile

	has_many :affiliation_positions
	has_many :positions, through: :affiliation_positions

end
