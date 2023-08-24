# ErrorExtractor

ErrorExtractor is a simple utility to extract errors from exceptions objects. It handles the different common ways an
exception message may be presented, so that you don't have to worry about how an exception object presents the information,
you just hand it to ErrorExtractor and get back a string you can print to a log or the console, etc.

## Installation

### Bundler

    gem 'error_extractor', '~> 0.1.0'

### Gem install

    $ gem install error_extractor

## Usage

ErrorExtractor is meant to be used in rescue blocks:

```
begin

    raise "an Error!"

rescue => e 
    log "An error occurred during processing: #{extract_errors(e)}" 
    log "An error with a backtrace: #{extract_errors_with_backtrace(e)}"
end 
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. 
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/duskhacker/error-extractor.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
