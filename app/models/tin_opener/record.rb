module TinOpener
  class Record < ActiveRecord::Base
    belongs_to :data_set

    validates :data_set, presence: true
    validates :row_data, presence: true
  end
end
