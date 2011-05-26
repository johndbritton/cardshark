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
  s.summary     = %q{A library for various types of card decks}
  s.description = %q{Supports Canasta, French, Piquet, and Uno Decks}

  s.rubyforge_project = "cardshark"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.0.0.beta.22"
end
