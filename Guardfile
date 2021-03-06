# frozen_string_literal: true

guard :rspec, cmd: 'bundle exec rspec', failed_mode: :keep do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)
end

rubocop_options = {
  all_on_start: false,
  cli: '--auto-correct --format simple'
}
guard :rubocop, rubocop_options do
  watch(/.+\.rb$/)
  watch(%r{(?:.+\/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
end
