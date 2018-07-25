class Prefecture < ApplicationRecord
	has_many :spots
	has_many :users
end
