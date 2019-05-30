class SustainableDevelopmentGoal < ApplicationRecord

	validates :code, presence: true
	validates :title_en, presence: true
	validates :title_fr, presence: true
	validates :description_en, presence: true
	validates :description_fr, presence: true

end
