# tin_opener

Opening Data, one Tin at a time.

Rails Engine developed in the context of the Ayuntamiento de Madrid's Open Data project [https://twitter.com/hashtag/openmad](#OpenMad).

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

## TODO

Support for more data formats:

* Excel
