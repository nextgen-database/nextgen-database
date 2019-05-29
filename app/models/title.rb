class Title < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_one :position

end
