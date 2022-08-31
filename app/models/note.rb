class Note < ApplicationRecord
  belongs_to :creation_consultation, class_name: "Consultation"

  validates :content, presence: true
end
