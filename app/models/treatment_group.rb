class TreatmentGroup < ApplicationRecord
  has_many :treatments, dependent: :destroy

  def description
    hours = start_date.strftime("%Hh%M")
    day = end_date.strftime("%-d").to_i
    month = get_month(end_date.strftime("%_m").to_i - 1)
    year = end_date.strftime("%Y").to_i

    "Soins #{frequency} à #{hours} jusqu'au #{day} #{month} #{year}"
  end

  private

  def get_month(num)
    month = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Décembre"]
    month[num]
  end
end
