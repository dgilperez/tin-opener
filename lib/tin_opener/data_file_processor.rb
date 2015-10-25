module TinOpener
  class UnsupportedDataFileError < StandardError; end

  class DataFileProcessor
    def initialize(args = {})
      @file = args.fetch(:file)
    end

    delegate :headers, :rows, to: :file_type_processor

    private

    def file_type_processor
      @file_type_processor ||= case @file
        when File, Tempfile
          DataFileProcessors::CsvProcessor.new(file: @file)
        when String
          DataFileProcessors::XlsProcessor.new(file: @file)
        else
          fail UnsupportedDataFileError
        end
    end
  end
end
