module TinOpener
  module DataFileProcessors
    class XlsProcessor < TinOpener::DataFileProcessor
      def initialize(args = {})
        super
        fail NotImplementedError
      end

      def headers
        fail NotImplementedError
      end

      def rows
        fail NotImplementedError
      end
    end
  end
end
