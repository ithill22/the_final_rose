require 'rails_helper'

RSpec.describe 'Bachelorette Contestants Index Page' do
  before :each do
    test_data
  end
  describe 'As a visitor, when i visit the bachelorette contestants index page' do
    it 'I see a list of the bachelorettes contestants' do
      visit bachelorette_contestants_path(@bachelorette_1)
      within '#contestant-list' do
        expect(page).to have_content(@contestant_1.name)
        expect(page).to have_content(@contestant_1.age)
        expect(page).to have_content(@contestant_1.hometown)
        expect(page).to have_content(@contestant_2.name)
        expect(page).to have_content(@contestant_2.age)
        expect(page).to have_content(@contestant_2.hometown)
        expect(page).to have_content(@contestant_3.name)
        expect(page).to have_content(@contestant_3.age)
        expect(page).to have_content(@contestant_3.hometown)
        expect(page).to_not have_content(@contestant_4.name)
        expect(page).to_not have_content(@contestant_4.age)
        expect(page).to_not have_content(@contestant_4.hometown)
      end
    end
  end
end