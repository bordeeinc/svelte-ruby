# frozen_string_literal: true

$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "svelte/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "svelte-ruby"
  spec.version     = Svelte::VERSION
  spec.authors     = ["Tomas Celizna"]
  spec.email       = ["mail@tomascelizna.com"]
  spec.homepage    = "https://github.com/tomasc/svelte-ruby"
  spec.summary     = "Svelte compiler for Ruby"
  spec.description = "Svelte compiler for Ruby"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "execjs", "~> 2.8"

  spec.add_development_dependency "minitest", "~> 5.14"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "rake"
end
