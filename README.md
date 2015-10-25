# tin_opener
[![Build Status](https://travis-ci.org/dgilperez/tin_opener.svg?branch=master)](https://travis-ci.org/dgilperez/tin_opener)
[![Code Climate](https://codeclimate.com/github/dgilperez/tin_opener/badges/gpa.svg)](https://codeclimate.com/github/dgilperez/tin_opener)
[![Gem Version](https://badge.fury.io/rb/tin_opener.svg)](https://badge.fury.io/rb/tin_opener)

Opening Data, one Tin at a time.

Rails Engine developed in the context of the Ayuntamiento de Madrid's Open Data project [#OpenMad](https://twitter.com/hashtag/openmad).

## Usage

Add gem to `Gemfile`:

    gem 'tin_opener', github: 'dgilperez/tin_opener'

Add a mounting point to your `routes.rb`

    mount TinOpener::Engine => "/tin_opener"

Run migrations:

    rake tin_opener:install:migrations
    rake db:migrate

This gem provides the following models:

* `TinOpener::DataSet` is any type of data structure you declare in your data domain. It's defined by it's name and headers, which in turn is a hash of key name and data type pairs.
* `TinOpener::Record` is a instance of data belonging to a DataSet format, extracted from any CSV form.

Data input format support:

* CSV
* XLS (basic)

## TODO

Support for more data formats:

* XLST
* XLS (test different scenarios)
* XML
* Custom Data Sources

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Also, you should read and follow our [Code of Conduct](https://github.com/dgilperez/tin_opener/blob/master/CODE_OF_CONDUCT.md).

## Contributors

To see the generous people who have contributed code, take a look at the [contributors list](http://github.com/dgilperez/tin_opener/contributors).

## Maintainers

* [David Gil](http://github.com/dgilperez)

## License

Copyright (c) 2015 David Gil Pérez, released under the GNU AFFERO GENERAL PUBLIC license
