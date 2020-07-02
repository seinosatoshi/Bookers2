class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         validates :name, length: {minimum: 2}
         validates :name, length: {maximum: 20}

         has_many :post_images, dependent: :destroy
end
