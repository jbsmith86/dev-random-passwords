# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dev-random-passwords/version'

Gem::Specification.new do |spec|
  spec.name          = "dev-random-passwords"
  spec.version       = DevRandomPasswords::VERSION
  spec.authors       = ["Joel Smith"]
  spec.email         = ["joel@trosic.com"]
  spec.summary       = %q{Passwords that need to be used long term and are randomly generated need more randomness than your standard random library}
  spec.description   = %q{On Linux, Unix or OSX /dev/random can be used to create really secure passwords from random bytes. This gem provides an implementation to do just that.}
  spec.homepage      = "https://github.com/jbsmith86/dev-random-passwords"
  spec.license       = "BSD-3-Clause-Clear"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.executables   = ["randompasswords"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
