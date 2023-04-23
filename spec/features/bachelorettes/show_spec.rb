require 'rails_helper'

RSpec.describe 'Bachelorette Show Page' do
  before :each do
    test_data
  end
  describe 'As a visitor, when i visit the bachelorette show page' do
    it 'I see the bachelorette name, season number, and season description' do
      visit bachelorette_path(@bachelorette_1)
      
      expect(page).to have_content(@bachelorette_1.name)
      expect(page).to have_content(@bachelorette_1.season_number)
      expect(page).to have_content(@bachelorette_1.season_description)
      expect(page).to_not have_content(@bachelorette_2.name)
    end

    it 'I see a list of the bachelorettes contestants' do
      visit bachelorette_path(@bachelorette_1)
      expect(page).to have_link("Contestants")
      click_link("Contestants")
      expect(current_path).to eq(bachelorette_contestants_path(@bachelorette_1))
    end

    it 'I see the average age of the bachelorettes contestants' do
      visit bachelorette_path(@bachelorette_1)
      expect(page).to have_content(@bachelorette_1.average_contestant_age)
    end
  end
end