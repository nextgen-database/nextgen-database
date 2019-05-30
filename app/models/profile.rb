class Profile < ApplicationRecord

	validates :firstname, presence: true

	has_many :profile_sectors
	has_many :sectors, through: :profile_sectors

	has_many :profile_demographics
	has_many :demographics, through: :profile_demographics

	has_many :profile_development_actors
	has_many :development_actors, through: :profile_development_actors

	has_many :profile_research_methods
	has_many :research_methods, through: :profile_research_methods

	has_many :affiliations, inverse_of: :profile

	# This is for the cocoon gem and nested forms
	accepts_nested_attributes_for :affiliations, reject_if: :all_blank, allow_destroy: true

end
