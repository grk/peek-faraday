# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peek-faraday/version'

Gem::Specification.new do |gem|
  gem.name          = 'peek-faraday'
  gem.version       = Peek::Faraday::VERSION
  gem.authors       = ['Grzesiek Kołodziejczyk']
  gem.email         = ['gk@code-fu.pl']
  gem.description   = %q{Take a peek into the Faraday requests made during your application's requests.}
  gem.summary       = %q{Take a peek into the Faraday requests made during your application's requests.}
  gem.homepage      = 'https://github.com/grk/peek-faraday'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'peek'
  gem.add_dependency 'faraday'
  gem.add_dependency 'faraday_middleware'
  gem.add_dependency 'atomic', '>= 1.0.0'
end
