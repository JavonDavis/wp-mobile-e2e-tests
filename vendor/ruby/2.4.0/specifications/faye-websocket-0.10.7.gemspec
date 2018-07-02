# -*- encoding: utf-8 -*-
# stub: faye-websocket 0.10.7 ruby lib

Gem::Specification.new do |s|
  s.name = "faye-websocket".freeze
  s.version = "0.10.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["James Coglan".freeze]
  s.date = "2017-02-22"
  s.email = "jcoglan@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "https://github.com/faye/faye-websocket-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze, "--markup".freeze, "markdown".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Standards-compliant WebSocket server and client".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>.freeze, [">= 0.12.0"])
      s.add_runtime_dependency(%q<websocket-driver>.freeze, [">= 0.5.1"])
      s.add_development_dependency(%q<permessage_deflate>.freeze, [">= 0"])
      s.add_development_dependency(%q<progressbar>.freeze, [">= 0"])
      s.add_development_dependency(%q<public_suffix>.freeze, ["< 1.5.0"])
      s.add_development_dependency(%q<puma>.freeze, [">= 2.0.0"])
      s.add_development_dependency(%q<rack>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-eventmachine>.freeze, [">= 0.2.0"])
      s.add_development_dependency(%q<rainbows>.freeze, ["~> 4.4.0"])
      s.add_development_dependency(%q<thin>.freeze, [">= 1.2.0"])
      s.add_development_dependency(%q<goliath>.freeze, [">= 0"])
      s.add_development_dependency(%q<passenger>.freeze, [">= 4.0.0"])
    else
      s.add_dependency(%q<eventmachine>.freeze, [">= 0.12.0"])
      s.add_dependency(%q<websocket-driver>.freeze, [">= 0.5.1"])
      s.add_dependency(%q<permessage_deflate>.freeze, [">= 0"])
      s.add_dependency(%q<progressbar>.freeze, [">= 0"])
      s.add_dependency(%q<public_suffix>.freeze, ["< 1.5.0"])
      s.add_dependency(%q<puma>.freeze, [">= 2.0.0"])
      s.add_dependency(%q<rack>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-eventmachine>.freeze, [">= 0.2.0"])
      s.add_dependency(%q<rainbows>.freeze, ["~> 4.4.0"])
      s.add_dependency(%q<thin>.freeze, [">= 1.2.0"])
      s.add_dependency(%q<goliath>.freeze, [">= 0"])
      s.add_dependency(%q<passenger>.freeze, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<eventmachine>.freeze, [">= 0.12.0"])
    s.add_dependency(%q<websocket-driver>.freeze, [">= 0.5.1"])
    s.add_dependency(%q<permessage_deflate>.freeze, [">= 0"])
    s.add_dependency(%q<progressbar>.freeze, [">= 0"])
    s.add_dependency(%q<public_suffix>.freeze, ["< 1.5.0"])
    s.add_dependency(%q<puma>.freeze, [">= 2.0.0"])
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-eventmachine>.freeze, [">= 0.2.0"])
    s.add_dependency(%q<rainbows>.freeze, ["~> 4.4.0"])
    s.add_dependency(%q<thin>.freeze, [">= 1.2.0"])
    s.add_dependency(%q<goliath>.freeze, [">= 0"])
    s.add_dependency(%q<passenger>.freeze, [">= 4.0.0"])
  end
end
