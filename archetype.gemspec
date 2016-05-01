$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "archetype/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "archetype"
  s.version     = Archetype::VERSION
  s.authors     = ["Tom Beynon"]
  s.email       = ["tombeynon@gmail.com"]
  s.homepage    = "http://github.com/lateralstudios/archetype"
  s.summary     = "Management framework for rails"
  s.description = "Management framework for rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4"

  s.add_dependency "sqlite3"
  s.add_dependency "rspec-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "sass-rails"
  s.add_dependency "responders"
  s.add_dependency "has_scope"
  s.add_dependency "kaminari"
  s.add_dependency "country_select"
  s.add_dependency "simple_form"
  s.add_dependency "nested_form"
  s.add_dependency "wysiwyg-rails", "2.2.4"
end
