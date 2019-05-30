class AffiliationPosition < ApplicationRecord

	belongs_to :affiliation
	belongs_to :position

	# Add bcause of the cocoon gem
	accepts_nested_attributes_for :position, :reject_if => :all_blank

end
