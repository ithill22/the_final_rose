class Contestant <ApplicationRecord
  validates_presence_of :name, :age, :hometown
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings
end
