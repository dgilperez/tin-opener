module TinOpener
  class DataFileProcessor
    def initialize(args = {})
      @file      = args.fetch(:file)
      @separator = args.fetch(:separator) { ';' }
    end

    def headers
      @headers ||= rows.first.transform_values do |value|
          value.class.name
        end
    end

    def rows
      @csv_data ||= CSV.parse(@file, col_sep: @separator, headers: true).map do |row|
          row.to_hash.transform_keys{ |a| a.squeeze.strip.gsub(/\s/, '_').underscore.to_sym }
        end
    end
  end
end
