# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'soupcms/common/version'

Gem::Specification.new do |spec|
  spec.name          = 'soupcms-common'
  spec.version       = SoupCMS::Common::VERSION
  spec.authors       = ['Sunit Parekh']
  spec.email         = ['parekh.sunit@gmail.com']
  spec.description   = %q{Common classes to be shared across soupcms components like soupcms-api, soupcms-core and soupcms-admin}
  spec.summary       = %q{Common classes to be shared across soupcms components like soupcms-api, soupcms-core and soupcms-admin}
  spec.homepage      = 'https://github.com/soupcms/soupcms-common'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
