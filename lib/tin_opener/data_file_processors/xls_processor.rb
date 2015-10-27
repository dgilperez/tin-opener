module TinOpener
  module DataFileProcessors
    # Handles both XLS and XLST formats. Actually, any format supported by *roo* gem.
    class XlsProcessor < TinOpener::DataFileProcessor
      delegate :headers, :rows, to: :csv_processor

      private

      def raw_data
        @raw_data ||= Roo::Spreadsheet.open(@file.path)
      end

      def csv_processor
        @csv_processor ||= CsvProcessor.new(file: tempfile.tap { write_csv_data })
      end

      def tempfile
        @tempfile ||= Tempfile.new(filename)
      end

      def filename
        @file.path.split('/').last
      end

      # TODO: Roo has a built-in .to_yaml transform. Consider using that over CSV
      #       whenever a YAML processor is implemented
      def write_csv_data
        # arguments: filename = nil, separator = ',', sheet = default_sheet
        @csv_data ||= raw_data.to_csv(tempfile, ';')
      end
    end
  end
end
