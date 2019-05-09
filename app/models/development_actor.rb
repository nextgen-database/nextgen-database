class DevelopmentActor < ApplicationRecord
	has_many :profile_development_actors
	has_many :profiles, through: :profile_development_actors
end
