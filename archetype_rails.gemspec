$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "archetype_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "archetype_rails"
  s.version     = ArchetypeRails::VERSION
  s.authors     = ["Tom Beynon"]
  s.email       = ["tombeynon@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ArchetypeRails."
  s.description = "TODO: Description of ArchetypeRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
