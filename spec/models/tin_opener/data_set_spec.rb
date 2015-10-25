require 'rails_helper'

module TinOpener
  RSpec.describe DataSet, type: :model do
    let(:data_file) { File.open(File.join('spec', 'fixtures', 'data_sets', 'bici_disponibilidad.csv'), 'r') }
    let(:data_set)  { build :tin_opener_data_set }

    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of(:name).scoped_to(:headers) }
      it { is_expected.to validate_presence_of :headers }
    end

    describe "processing data file" do
      it "accepts a new data file in CSV format and turns it into a list of records" do
        data_set.data_file = data_file

        expect do
          expect(data_set.save).to be_truthy
        end.to change { Record.count }.from(0).to(70)
      end
    end
  end
end
