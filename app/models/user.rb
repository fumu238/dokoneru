class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :favorites, dependent: :destroy
   has_many :slepts, dependent: :destroy
   has_many :post_comments, dependent: :destroy
   has_many :spots, dependent: :destroy
   belongs_to :prefecture

   attachment :profile_image
   attachment :background_image

   validates :user_name, presence: true
   validates :name_phonetic, presence: true
   validates :nick_name, presence: true
   # validates :prefecture_id, presence: true


   def active_for_authentication?
    super && !delete_flag?
  end
end
