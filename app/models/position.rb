class Position < ApplicationRecord

	belongs_to :title, inverse_of: :position

	has_many :affiliation_positions
	has_many :affiliations, through: :affiliation_positions

	# This is for the cocoon gem and nested forms
	accepts_nested_attributes_for :affiliation_positions, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :affiliations, reject_if: :all_blank, allow_destroy: true

end
