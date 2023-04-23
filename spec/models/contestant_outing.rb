require 'rails_helper'

RSpec.describe ContestantOuting, type: :model do
  describe 'validations' do
    it {should validate_presence_of :contestant_id}
    it {should validate_presence_of :outing_id}
  end
  describe 'relationships' do
    it {should belong_to :contestant}
    it {should belong_to :outing}
  end
end