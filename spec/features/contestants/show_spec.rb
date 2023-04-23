require 'rails_helper'

RSpec.describe 'Contestant Show Page' do
  before :each do
    test_data
  end
  describe 'As a visitor, when i visit the contestant show page' do
    it 'I see the contestants name, season number, and season description' do
      visit contestant_path(@contestant_1)
      
      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@bachelorette_1.season_number)
      expect(page).to have_content(@bachelorette_1.season_description)
    end

    it 'I see a list of the contestants outings' do
      visit contestant_path(@contestant_1)
      within '#outings-list' do
        expect(page).to have_link(@outing_1.name)
        expect(page).to have_link(@outing_2.name)
        expect(page).to have_link(@outing_3.name)
      end

      click_link @outing_1.name

      expect(current_path).to eq(outing_path(@outing_1))
    end
  end
end