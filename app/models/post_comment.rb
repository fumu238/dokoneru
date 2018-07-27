class PostComment < ApplicationRecord
	belongs_to :spot
	belongs_to :user

	validates :comment, presence: true, length: { maximum: 140 }
end
