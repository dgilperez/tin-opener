module TinOpener
  class DataSet < ActiveRecord::Base
    has_many :records, dependent: :destroy

    validates :headers, presence: true
    validates :name, presence: true
  end
end
