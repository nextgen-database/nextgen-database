class Title < ApplicationRecord

	validates :english, presence: true
	validates :french, presence: true

	has_one :position

	accepts_nested_attributes_for :position, reject_if: :all_blank, allow_destroy: true

end
