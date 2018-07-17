class Spot < ApplicationRecord
	has_many :slepts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :spot_images, dependent: :destroy
	belongs_to :prefecture
	belongs_to :area
	belongs_to :user
	attachment :image

	self.inheritance_column = :_type_disabled
end
