class Spot < ApplicationRecord
	has_many :slepts
	has_many :favorites
	has_many :post_comments
end
