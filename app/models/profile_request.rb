class ProfileRequest < ApplicationRecord

	belongs_to :user
    belongs_to :profile
    belongs_to :approver, class_name: "User", foreign_key: 'approver_id'

	# How to setup enums in rails
	# https://naturaily.com/blog/ruby-on-rails-enum
	enum status: { not_set: 0, approved: 1, denied: 2 }, _prefix: :status

end
