module TinOpener
  module DataFileProcessors
    class CsvProcessor < TinOpener::DataFileProcessor
      def initialize(args = {})
        super
        @separator = args.fetch(:separator) { ';' }
      end

      def headers
        @headers ||= rows.first.try do |row|
          row.transform_values do |value|
            value ? value.class.name : 'String'
          end
        end
      end

      def rows
        @csv_data ||= CSV.parse(@file, col_sep: @separator, headers: true).map do |row|
            row.to_hash.transform_keys{ |a| a.gsub(/\s+/, ' ').strip.gsub(/\s/, '_').underscore.to_sym }
          end
      end
    end
  end
end
