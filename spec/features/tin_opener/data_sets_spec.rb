require 'rails_helper'

module TinOpener
  RSpec.feature "Data sets", type: :feature do

    let(:data_file) { File.join('spec', 'fixtures', 'data_sets', 'bici_disponibilidad.csv') }
    let(:data_set)  { create :data_set }

    scenario "Lists data sets" do
      data_sets = 3.times.map { create :data_set }

      visit data_sets_path

      data_sets.each do |data_set|
        expect(page).to have_content(data_set.name)
      end
    end

    scenario "Deletes a data set" do
      data_set

      visit data_sets_path

      expect(page).to have_content(data_set.name)

      expect do
        click_on 'Destroy'
      end.to change { DataSet.count }.by(-1)

      expect(page).not_to have_content(data_set.name)
    end

    scenario "Updates a data set" do
      data_set

      visit data_sets_path

      click_link 'Edit'

      fill_in 'data_set[name]', with: 'A new fancy name'
      click_on 'Update Data set'

      expect(page).to have_content('A new fancy name')
    end

    scenario "Adds a new data set from a CSV data source" do
      visit data_sets_path

      fill_in 'data_set[name]', with: 'Oh yes this IS a new one'
      attach_file 'data_set[data_file]', data_file

      expect do
        expect do
          click_on 'Create Data set'
        end.to change { DataSet.count }.by(1)
      end.to change { Record.count }.by(70)

      expect(page).to have_content('Oh yes this IS a new one')
    end
  end
end
