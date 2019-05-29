class Title < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

end
