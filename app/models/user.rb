class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :favorites
         has_many :slepts
         has_many :post_comments
         has_many :spots

         attachment :profile_image
         attachment :background_image
end