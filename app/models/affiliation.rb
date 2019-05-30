class Affiliation < ApplicationRecord

	belongs_to :organisation
	belongs_to :profile

	has_many :affiliation_positions
	has_many :positions, through: :affiliation_positions

	# This is for the cocoon gem and nested forms
	accepts_nested_attributes_for :affiliation_positions, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :positions, reject_if: :all_blank, allow_destroy: true

end
