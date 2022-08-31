class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :patients, foreign_key: :referring_user_id
  has_many :consultations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tel_number, presence: true
  validates :email, presence: true
  validates :gender, presence: true

  validates :email, format: { with: /\A.*@.*\.com\z/ }
end
