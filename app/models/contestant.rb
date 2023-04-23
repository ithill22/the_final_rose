class Contestant <ApplicationRecord
  validates_presence_of :name, :age, :hometown
  belongs_to :bachelorette
  
end
