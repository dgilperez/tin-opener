require 'rails_helper'

module TinOpener
  RSpec.describe DataSet, type: :model do
    let(:data_file) { File.open(File.join(Rails.root, 'spec', 'fixtures', 'data_sets', 'bici_disponibilidad.csv'), 'r') }
    let(:data_set)  { build :data_set }

    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of(:name).scoped_to(:headers) }
      it { is_expected.to validate_presence_of :headers }
    end

    describe "processing data file" do

    end
  end
end
