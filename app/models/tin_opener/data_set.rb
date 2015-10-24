module TinOpener
  class DataSet < ActiveRecord::Base
    has_many :records, dependent: :destroy

    validates :name, presence: true
    # validates :headers, presence: true
  end
end
