require_relative "core/lib/archetype/core/version"

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

  s.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.require_path = 'lib'

  s.add_dependency "archetype_core"
  s.add_dependency "archetype_interface"
  s.add_dependency "archetype_attributes"
  s.add_dependency "archetype_resourceful"
  s.add_dependency "archetype_dashboard"
end
