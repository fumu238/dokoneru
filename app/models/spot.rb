class Spot < ApplicationRecord
	has_many :slepts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :spot_images, dependent: :destroy
	belongs_to :prefecture
	belongs_to :area
	belongs_to :user
	# attachment :image
	self.inheritance_column = :_type_disabled

	def favorite_user(user)
		favorites.find_by(user_id: user.id)
	end

	def slept_user(user)
		slepts.find_by(user_id: user.id)
	end
end
