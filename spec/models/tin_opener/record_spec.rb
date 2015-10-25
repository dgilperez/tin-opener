require 'rails_helper'

module TinOpener
  RSpec.describe Record, type: :model do
    let(:data_set) { create :data_set }
    let(:record)   { build record, data_set: data_set }

    it { is_expected.to validate_presence_of :row_data }
  end
end
