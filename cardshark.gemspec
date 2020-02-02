# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cardshark/version"

Gem::Specification.new do |s|
  s.name        = "cardshark"
  s.version     = Cardshark::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John Britton - @johndbritton"]
  s.email       = ["public@johndbritton.com"]
  s.homepage    = "http://www.johndbritton.com"
  s.summary     = %q{}
  s.description = %q{}

  s.rubyforge_project = "cardshark"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "guard-rspec", "~> 4.7.3"
  s.add_development_dependency "rspec", "~> 3.9.0"
  s.add_development_dependency "terminal-notifier-guard", "~> 1.7.0"
end
