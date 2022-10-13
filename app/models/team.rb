class Team < ApplicationRecord
  belongs_to :creator
  has_many :memberships
end
