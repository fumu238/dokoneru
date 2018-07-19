class SpotImage < ApplicationRecord
	belongs_to :spot
	attachment :image

	# validates :image_id, presence: true
end
