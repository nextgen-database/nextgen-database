class ProfileCountry < ApplicationRecord
	belongs_to :profile
	belongs_to :country
end
