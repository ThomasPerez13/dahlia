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

  # Class method to select patient by nurses team
  # used with patients_controller #index and consultations_controller #new
  def self.select_patient_by_group(user)
    teams = []
    patients = user.patients
    user.memberships.each do |membership|
      teams << membership.team
    end
    teams.each do |team|
      team.memberships.each do |membership|
        patients << membership.user.patients
      end
    end
    patients.order(last_name: :asc)
  end

  def display_full_name
    "#{first_name} #{last_name}"
  end
end
