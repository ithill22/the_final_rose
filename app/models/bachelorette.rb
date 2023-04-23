class Bachelorette <ApplicationRecord
  validates_presence_of :name, :season_number, :season_description
  has_many :contestants
  
  def average_contestant_age
    contestants.average(:age).to_f.round(2)
  end

  def unique_hometowns
    contestants.pluck(:hometown).uniq
  end
end
