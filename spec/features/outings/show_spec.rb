require 'rails_helper'

RSpec.describe 'Outing Show Page' do
  before :each do
    test_data
  end

  describe 'As a visitor, when i visit the outing show page' do
    it 'I see the outing name, location, date, and the number of contestants' do
      visit outing_path(@outing_1)
   
      expect(page).to have_content(@outing_1.name)
      expect(page).to have_content(@outing_1.location)
      expect(page).to have_content(@outing_1.date)
      expect(page).to have_content(@outing_1.contestant_count)
      expect(page).to_not have_content(@outing_2.name)
    end

    it 'I see a list of the outings contestants' do
      visit outing_path(@outing_1)
      within '#contestants-list' do
        expect(page).to have_content(@contestant_1.name)
        expect(page).to have_content(@contestant_2.name)
        expect(page).to have_content(@contestant_3.name)
        expect(page).to_not have_content(@contestant_4.name)
      end
    end
  end
end