require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  before :each do
    test_data
  end
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :season_number}
    it {should validate_presence_of :season_description}
  end
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'instance methods' do
    it 'average_contestant_age' do
      expect(@bachelorette_1.average_contestant_age).to eq(26.33)
      expect(@bachelorette_2.average_contestant_age).to eq(29.0)
    end

    it 'unique_hometowns' do
      expect(@bachelorette_1.unique_hometowns).to eq(["Denver, CO", "Los Angeles, CA"])
      expect(@bachelorette_2.unique_hometowns).to eq(["Chicago, IL", "New York, NY", "Dallas, TX"])
    end
  end
end
