class Bachelorette <ApplicationRecord
  validates_presence_of :name, :season_number, :season_description
  has_many :contestants
  
end
