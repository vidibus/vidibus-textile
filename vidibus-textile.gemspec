# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{vidibus-textile}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andre Pankratz"]
  s.date = %q{2010-10-01}
  s.description = %q{Provides textile formatting through RedCloth and adds methods for getting plain text version of textile markup.}
  s.email = %q{andre@vidibus.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".rspec",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/vidibus-textile.rb",
     "lib/vidibus/textile.rb",
     "lib/vidibus/textile/extensions.rb",
     "lib/vidibus/textile/extensions/view.rb",
     "spec/spec_helper.rb",
     "spec/vidibus/textile/action_view_spec.rb",
     "spec/vidibus/textile_spec.rb",
     "vidibus-textile.gemspec"
  ]
  s.homepage = %q{http://github.com/vidibus/vidibus-textile}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Wrapper for RedCloth with extensions.}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/vidibus/textile/action_view_spec.rb",
     "spec/vidibus/textile_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<RedCloth>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<RedCloth>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<RedCloth>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end
