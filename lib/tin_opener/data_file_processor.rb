module TinOpener
  class UnsupportedDataFileError < StandardError; end

  class DataFileProcessor
    def initialize(args = {})
      @file = args.fetch(:file)
    end

    delegate :headers, :rows, to: :file_type_processor

    private

    def file_type_processor
      @file_type_processor ||= case mime_type
        when 'text/csv', 'text/comma-separated-values', 'text/plain'
          DataFileProcessors::CsvProcessor.new(file: @file)
        when 'application/excel'
          DataFileProcessors::XlsProcessor.new(file: @file)
        else
          fail UnsupportedDataFileError
        end
    end

    # TODO: Current implementation extracts MIME from file extension.
    #       This will fail for files with bad extensions (a CSV renamed as a XLS),
    #       or with files with no extension
    #
    #       Options to consider:
    #       - Use ruby-filemagic gem
    #       - Use or compare with output from (*nix only)
    #           `file #{@file.path} --mime-type`.gsub("\n", '').split(':')[1].split('/')[1].gsub('x-', '').gsub(/jpeg/, 'jpg').gsub(/text/, 'txt').gsub(/x-/, '')
    def mime_type
      @mime_type ||= MIME::Types.type_for(@file.path).first.try(:simplified)
    end
  end
end
