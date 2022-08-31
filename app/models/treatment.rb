class Treatment < ApplicationRecord
  belongs_to :consultation

  CATEGORY = %W[Injection Pansement Prélèvement Perfusion Hygiène Cathéter Aide domicile Médicament Diabétique Autre]
  # faire le include category () et mettre dans une variable
  validates :category, inclusion: { in: CATEGORY }
end
