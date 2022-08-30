class Patient < ApplicationRecord
  belongs_to :referring_user, class_name: "User"

  has_many :consultations
end
