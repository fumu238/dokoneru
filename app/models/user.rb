class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :favorites, dependent: :destroy
         has_many :slepts, dependent: :destroy
         has_many :post_comments, dependent: :destroy
         has_many :spots

         attachment :profile_image
         attachment :background_image

  # def favorite_spot(spot_id)
  #     favorites.where(spot_id: [:spot][:spot_id])
  # end

  # def slept_spot(spot_id)
  #     slepts.where(spot_id: [:spot][:spot_id])
  # end
end
