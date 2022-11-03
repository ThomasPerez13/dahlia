class Recurrence < ApplicationRecord
  has_many :consultations
  belongs_to :patient
end
