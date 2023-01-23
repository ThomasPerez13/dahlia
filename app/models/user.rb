class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :patients, foreign_key: :referring_user_id
  has_many :consultations
  has_many :memberships
  has_many :teams_as_creator, foreign_key: :creator_id, class_name: "team"

  validates :first_name, :last_name, :email, presence: true


  def display_full_name
    "#{first_name} #{last_name}"
  end

end
