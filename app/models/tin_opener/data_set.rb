module TinOpener
  class DataSet < ActiveRecord::Base
    has_many :records, dependent: :destroy

    attr_accessor :data_file, :processed_data_file

    validates :name, presence: true
    validates :headers, presence: true

    before_validation :process_data_file

    private

    def process_data_file
      return @processed_data_file if @processed_data_file

      return unless data_file.presence
      file = data_file.tempfile if data_file.respond_to?(:tempfile)
      # return unless file.is_a?(File)

      # data_file_processor = DataFileProcessor.new(file: data_file).to_hash
      data_file_processor = DataFileProcessor.new(file: file)
      self.headers = data_file_processor.headers
      @processed_data_file = data_file_processor.rows
      # self.records << records
    end
  end
end
