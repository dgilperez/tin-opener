module TinOpener
  class DataFileProcessor
    def initialize(args = {})
      @file      = args.fetch(:file)
      @separator = args.fetch(:separator) { ';' }
    end

    def to_hash
      csv_data.map(&:to_hash)
    end

    def headers
      @headers ||= rows.first
    end

    def rows
      @rows ||= CSV.parse(@file, col_sep: @separator, headers: true).map do |row|
          row.to_hash.transform_keys{ |a| a.squeeze.strip.gsub(/\s/, '_').underscore.to_sym }
        end
    end
  end
end
