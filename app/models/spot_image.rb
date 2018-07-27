class SpotImage < ApplicationRecord
	belongs_to :spot
	attachment :image

	validates :image, presence: true
	validates :image_discription, presence: true, length: { maximum: 40}
end
