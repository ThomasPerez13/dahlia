class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :user

  has_many :notes, foreign_key: :creation_consultation_id
  has_many :treatments

  validates :start_date, presence: true


  def done?
    treatments.all? do |treatment|
      treatment.done == true
    end
  end
end
