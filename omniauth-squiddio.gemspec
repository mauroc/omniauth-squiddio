# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-squiddio/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mauro Calvi"]
  gem.email         = ["coupdemistral@gmail.com"]
  gem.description   = %q{OmniAuth strategy for squidd.io}
  gem.summary       = %q{OmniAuth strategy for squidd.io}
  gem.homepage      = "https://github.com/mauroc/omniauth-squiddio"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-squiddio"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Squiddio::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  #gem.add_dependency 'box-api'
