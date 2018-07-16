class Spot < ApplicationRecord
	has_many :slepts
	has_many :favorites
	has_many :post_comments
	belongs_to :prefecture
	belongs_to :area
	belongs_to :user

	self.inheritance_column = :_type_disabled
end
