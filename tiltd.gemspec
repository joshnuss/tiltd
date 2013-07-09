# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tiltd/version'

Gem::Specification.new do |spec|
  spec.name          = "tiltd"
  spec.version       = Tiltd::VERSION
  spec.authors       = ["Josh Nussbaum"]
  spec.email         = ["joshnuss@gmail.com"]
  spec.description   = "Serve static files with rack and tilt"
  spec.summary       = "A simple rack server for serving common template extensions"
  spec.homepage      = "http://github.com/joshnuss/tiltd"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rack'
  spec.add_dependency 'tilt'
  spec.add_dependency 'sass'
  spec.add_dependency 'coffee-script'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
end
