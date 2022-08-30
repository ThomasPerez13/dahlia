class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :user

  has_many :notes, foreign_key: :creation_consultation_id
end
