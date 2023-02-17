class Treatment < ApplicationRecord
  belongs_to :consultation

  CATEGORY = %W[INJECTION PANSEMENT PRELEVEMENT PERFUSION HYGIENE MEDICAMENT DIABETE SONDAGE AUTRE]

  # faire le include category () et mettre dans une variable
  # / DONE / Effacé le catheter
  validates :category, inclusion: { in: CATEGORY }
end
