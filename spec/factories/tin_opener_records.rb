FactoryGirl.define do
  factory :tin_opener_record, class: 'TinOpener::Record' do
    tin_opener_data_set
    row_data { { id: 1, text: "A value"} }
  end
end
