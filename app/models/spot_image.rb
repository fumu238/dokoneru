class SpotImage < ApplicationRecord
	belongs_to :spot
	attachment :image

	validates :image, presence: true
end
