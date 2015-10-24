# tin-opener

Opening Data, one Tin at a time.

Rails Engine developed in the context of the Ayuntamiento de Madrid's Open Data project [https://twitter.com/hashtag/openmad](#OpenMad).

## Usage

Add gem to `Gemfile`:

    gem 'tin_opener'

Add a mounting point to your `routes.rb`

    mount TinOpener::Engine => "/tin_opener"

Run migrations:

    rake tin_opener:install:migrations
    rake db:migrate 
