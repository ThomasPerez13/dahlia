class Treatment < ApplicationRecord
  belongs_to :consultation
  belongs_to :treatment_group, optional: true

  CATEGORY = %W[INJECTION PANSEMENT PRELEVEMENT PERFUSION HYGIENE MEDICAMENT DIABETE SONDAGE AUTRE]

  after_save :set_recurency

  # faire le include category () et mettre dans une variable
  # / DONE / Effacé le catheter
  validates :category, inclusion: { in: CATEGORY }

  def set_recurency
    # set recurrency only if "soins régulié ?" is selected in the form and if treatment don't have a treatment group yet
    if self.recurring && self.treatment_group.nil?
      # find Consultation group referred
      consultation_group = ConsultationGroup.find(self.consultation.consultation_group.id)
      # select the following consultation in calendar
      consultations = consultation_group.consultations.select { |consultation| consultation.start_date > self.consultation.start_date}

      # create a new treatment_grouped
      treatment_group = TreatmentGroup.create!(frequency: consultation_group.frequency, start_date: self.consultation.start_date, end_date: consultation_group.end_date)

      # update self to include it in a new treatment
      self.update(treatment_group: treatment_group)

      # create recurring treatment
      consultations.each do |consultation|
        Treatment.create!(category: self.category, done: false, content: self.content, recurring: true, consultation: consultation, treatment_group: treatment_group)
      end
    end
  end
end
