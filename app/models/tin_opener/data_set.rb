module TinOpener
  class DataSet < ActiveRecord::Base
    has_many :records, dependent: :destroy
  end
end
