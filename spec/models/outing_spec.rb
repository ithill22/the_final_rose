require 'rails_helper'

RSpec.describe Outing, type: :model do
  before :each do
    test_data
  end
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :location}
    it {should validate_presence_of :date}
  end

  describe 'relationships' do
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end

  describe 'instance methods' do
    it 'contestant_count' do
      expect(@outing_1.contestant_count).to eq(3)
      expect(@outing_2.contestant_count).to eq(2)
      expect(@outing_3.contestant_count).to eq(1)
      expect(@outing_4.contestant_count).to eq(0)
    end
  end
end