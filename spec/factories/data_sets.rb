FactoryGirl.define do
  factory :data_set, class: 'TinOpener::DataSet' do
    sequence(:name) { |n| "Data Set ##{n}" }
    headers { { id: 'Integer', text: 'String' } }
  end
end
