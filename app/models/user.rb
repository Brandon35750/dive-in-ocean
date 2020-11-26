class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tags
  # has_many :species, through: :tags
  has_one_attached :avatar

  validates :first_name, :last_name, :diving_level, presence: true
  validates :email, :username, presence: true, uniqueness: true
end
