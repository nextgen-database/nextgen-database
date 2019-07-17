class Prefix < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_one :profile

end
