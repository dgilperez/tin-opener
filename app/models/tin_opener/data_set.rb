module TinOpener
  class DataSet < ActiveRecord::Base
    has_many :records, dependent: :destroy

    attr_accessor :data_file, :processed_data_file

    validates :name, presence: true, uniqueness: { scope: :headers }
    validates :headers, presence: true

    before_validation :process_data_file

    private

    def process_data_file
      return unless data_file.presence
      file = data_file.tempfile if data_file.respond_to?(:tempfile)
      # return unless file.is_a?(File)

      data_file_processor = DataFileProcessor.new(file: file)

      self.headers = data_file_processor.headers

      import_records(data_file_processor.rows)
      # data_file_processor.rows.each do |row|
      #   records.new(row_data: row)
      # end
    end

    def import_records(record_attrs)
      to_import = record_attrs.map do |row|
          records.new(row_data: row)
        end

      Record.import to_import
    end
  end
end
