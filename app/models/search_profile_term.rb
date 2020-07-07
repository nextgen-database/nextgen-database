class SearchProfileTerm < ApplicationRecord

	# validates_uniqueness_of :term

	has_many :search_profiles

	before_save :downcase_term

	# Save the term in lowercase
	def downcase_term

		self.term.downcase! unless self.term.blank?
	end

end
