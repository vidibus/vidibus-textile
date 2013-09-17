# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'vidibus/textile/version'

Gem::Specification.new do |s|
  s.name        = 'vidibus-textile'
  s.version     = Vidibus::Textile::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'Andre Pankratz'
  s.email       = 'andre@vidibus.com'
  s.homepage    = 'https://github.com/vidibus/vidibus-textile'
  s.summary     = 'Advanced textile for Mongoid models'
  s.description = 'textile designed for advanced usage, like scheduling versions.'
  s.license     = 'MIT'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'vidibus-textile'

  s.add_dependency 'RedCloth'
  s.add_dependency 'activesupport', '>= 3'
  s.add_dependency 'actionpack', '>= 3'
  s.add_dependency 'mongoid', '>= 3'
  # s.add_dependency 'vidibus-core_extensions'

  s.add_development_dependency 'bundler', '>= 1.0.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rspec', '~> 2'
  s.add_development_dependency 'rr'

  s.files = Dir.glob('{lib,app,config}/**/*') + %w[LICENSE README.rdoc Rakefile]
  s.require_path = 'lib'
end
