class DevelopmentActor < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_many :profile_development_actors
	has_many :profiles, through: :profile_development_actors
end
