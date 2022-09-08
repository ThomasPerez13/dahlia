class Note < ApplicationRecord
  belongs_to :creation_consultation, class_name: "Consultation"

  validates :favorite, presence: true
  validates :content, presence: true
end
