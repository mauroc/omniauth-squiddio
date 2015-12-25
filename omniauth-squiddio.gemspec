# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-squiddio/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "omniauth-squiddio"
  gem.version       = OmniAuth::Squiddio::VERSION
  gem.authors       = ["Mauro Calvi"]
  gem.email         = ["coupdemistral@gmail.com"]
  gem.homepage      = "https://github.com/mauroc/omniauth-squiddio"
  gem.description   = %q{OmniAuth strategy for squidd.io}
  gem.summary       = %q{OmniAuth strategy for squidd.io}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth-oauth', '~> 1.1'
  #gem.add_dependency 'box-api'
end