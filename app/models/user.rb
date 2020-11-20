class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :motorcycles, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo


  before_create :set_avatar

  def set_avatar
      self.avatar = "https://cdn.pixabay.com/photo/2020/07/14/13/07/icon-5404125_960_720.png"
  end
end
