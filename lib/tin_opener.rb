require "tin_opener/engine"
require "tin_opener/data_file_processor"
require "tin_opener/data_file_processors/csv_processor"
require "tin_opener/data_file_processors/xls_processor"
require "csv"
require "roo"
require "roo-xls"
require "activerecord-import"
require 'pry-byebug' unless Rails.env.production?

module TinOpener
end
