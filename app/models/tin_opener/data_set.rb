module TinOpener
  class DataSet < ActiveRecord::Base
    has_many :records, dependent: :destroy

    attr_reader :data_file

    validates :name, presence: true, uniqueness: { scope: :headers }
    validates :headers, presence: true

    before_validation :process_data_file

    def data_file=(data_file)
      @data_file = data_file.respond_to?(:tempfile) ? data_file.tempfile : data_file
    end

    private

    def process_data_file
      return unless data_file.is_a?(File)

      data_file_processor = DataFileProcessor.new(file: data_file)

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
