# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'cardshark/version'

Gem::Specification.new do |s|
  s.name        = 'cardshark'
  s.version     = Cardshark::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['John Britton - @johndbritton']
  s.email       = ['public@johndbritton.com']
  s.homepage    = 'https://github.com/johndbritton/cardshark'
  s.summary     = 'A library for building decks of cards.'
  s.description = 'A library for building decks of cards.'

  s.rubyforge_project = 'cardshark'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`
                    .split("\n")
                    .map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'guard-rspec', '~> 4.7.3'
  s.add_development_dependency 'guard-rubocop', '~>1.3.0'
  s.add_development_dependency 'rspec', '~> 3.9.0'
  s.add_development_dependency 'rubocop', '~> 0.79.0'
  s.add_development_dependency 'terminal-notifier-guard', '~> 1.7.0'
end
