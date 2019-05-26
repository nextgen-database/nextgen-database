class ResearchMethod < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_many :profile_research_methods
	has_many :profiles, through: :profile_research_methods

end
