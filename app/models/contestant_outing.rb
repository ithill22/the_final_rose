class ContestantOuting < ApplicationRecord
  validates_presence_of :contestant_id, :outing_id
  belongs_to :contestant
  belongs_to :outing
end