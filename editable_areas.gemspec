# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'editable_areas/version'

Gem::Specification.new do |spec|
  spec.name          = "editable_areas"
  spec.version       = EditableAreas::VERSION
  spec.authors       = ["Kainage"]
  spec.email         = ["kainage@gmail.com"]
  spec.description   = %q{Renders text or an editor anywhere in your rails 4 application}
  spec.summary       = %q{Renders text or an editor anywhere in your rails 4 application}
  spec.homepage      = "https://github.com/kainage/editable_area"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "rspec-rails"
end
