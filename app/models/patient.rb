class Patient < ApplicationRecord
  belongs_to :referring_user, class_name: "User"
  has_many :consultations

  BLOOD_TYPE = %W[O- O+ B- B+ A- A+ AB- AB+]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  #validates :address, presence: true
  #validates :email, format: { with: /\A.*@.*\.com\z/ }
  #validates :tel_number, presence: true
  #validates :ss_number, uniqueness: true, presence: true
  #validates :blood_type, inclusion: { in: BLOOD_TYPE }

  def display_full_name
    "#{first_name} #{last_name}"
  end
end
