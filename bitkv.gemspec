# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitkv/version'

Gem::Specification.new do |spec|
  spec.name          = "bitkv"
  spec.version       = Bitkv::VERSION
  spec.authors       = ["Casey Kolderup"]
  spec.email         = ["casey@kolderup.org"]
  spec.summary       = %q{BitKV keystore}
  spec.description   = %q{A massively distributed cloud-based keystore}
  spec.homepage      = "http://github.com/ckolderup/bitkv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency "bitly"
  spec.add_dependency "dotenv"
end
