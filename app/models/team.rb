class Team < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  has_many :memberships
end
