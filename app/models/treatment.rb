class Treatment < ApplicationRecord
  belongs_to :consultation

  CATEGORY = %W[Injection Pansement Prélèvement Perfusion Hygiène Médicament Diabétique Aide\ domicile Autre]
  # faire le include category () et mettre dans une variable
  # / DONE / Effacé le catheter
  validates :category, inclusion: { in: CATEGORY }
end
