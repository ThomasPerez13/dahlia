class TreatmentGroup < ApplicationRecord
  has_many :treatments, dependent: :destroy
end
