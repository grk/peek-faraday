# Peek::Faraday

Take a peek into the Faraday requests made during your application's requests.

Things this peek view provides:

- Total number of Faraday requests called during the request
- The duration of the Faraday requests made during the request

## Installation

Add this line to your application's Gemfile:

    gem 'peek-faraday'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-faraday

## Usage

Add the following to your `config/initializers/peek.rb`:

```ruby
Peek.into Peek::Views::Faraday
```

Configure your Faraday connection to use instrumentation

```ruby
conn = Faraday.new(url) do |conn|
  conn.use :instrumentation
  conn.adapter Faraday.default_adapter
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
