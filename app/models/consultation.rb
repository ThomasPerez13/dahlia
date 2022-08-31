class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :user

  has_many :notes, foreign_key: :creation_consultation_id
  has_many :treatments
end
