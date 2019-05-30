class SustainableDevelopmentGoal < ApplicationRecord

	validates :goal, presence: true
	validates :short_description_en, presence: true
	validates :short_description_fr, presence: true
	validates :description_en, presence: true
	validates :description_fr, presence: true

end
