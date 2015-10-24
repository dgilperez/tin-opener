module TinOpener
  class Record < ActiveRecord::Base
    belongs_to :data_set
  end
end
