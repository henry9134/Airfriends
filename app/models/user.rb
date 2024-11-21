class User < ApplicationRecord
  has_one_attached :photo
  has_many :reviews_as_friend, dependent: :destroy, foreign_key: :friend_id, class_name: "Review"
  has_many :activities
  has_many :rentals
  has_many :requests, through: :activities, source: :rentals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

end
