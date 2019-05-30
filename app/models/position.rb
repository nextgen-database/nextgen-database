class Position < ApplicationRecord

	belongs_to :title

	has_many :affiliation_positions
	has_many :affiliations, through: :affiliation_positions
end
