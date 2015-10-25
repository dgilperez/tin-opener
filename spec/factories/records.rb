FactoryGirl.define do
  factory :record, class: 'TinOpener::Record' do
    data_set
    row_data { { id: 1, text: "A value"} }
  end
end
