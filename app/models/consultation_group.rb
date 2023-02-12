class ConsultationGroup < ApplicationRecord
  has_many :consultations, dependent: :destroy
end
