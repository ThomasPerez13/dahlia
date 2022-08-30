class Patient < ApplicationRecord
  belongs_to :referring_user, class_name: "User"
end
