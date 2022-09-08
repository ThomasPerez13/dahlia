class Note < ApplicationRecord
  belongs_to :creation_consultation, class_name: "Consultation"

  validates :favorite, inclusion: { in: [ true, false ] }
  validates :content, presence: true
end
