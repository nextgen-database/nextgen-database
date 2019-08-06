class OrganisationType < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_many :organisations

end
