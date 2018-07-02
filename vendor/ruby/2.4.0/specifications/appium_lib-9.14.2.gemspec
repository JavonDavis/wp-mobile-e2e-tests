# -*- encoding: utf-8 -*-
# stub: appium_lib 9.14.2 ruby lib

Gem::Specification.new do |s|
  s.name = "appium_lib".freeze
  s.version = "9.14.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["code@bootstraponline.com".freeze]
  s.date = "2018-06-25"
  s.description = "Ruby library for Appium.".freeze
  s.email = ["code@bootstraponline.com".freeze]
  s.homepage = "https://github.com/appium/ruby_lib".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Ruby library for Appium".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<appium_lib_core>.freeze, ["~> 1.7.2"])
      s.add_runtime_dependency(%q<tomlrb>.freeze, ["~> 1.1"])
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.8.1", "~> 1.8"])
      s.add_development_dependency(%q<posix-spawn>.freeze, ["~> 0.3"])
      s.add_development_dependency(%q<hashdiff>.freeze, ["~> 0.2.2"])
      s.add_development_dependency(%q<spec>.freeze, [">= 5.3.4", "~> 5.3"])
      s.add_development_dependency(%q<fakefs>.freeze, ["~> 0.6.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.9.11"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.46.0"])
      s.add_development_dependency(%q<rainbow>.freeze, ["~> 2.1.0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    else
      s.add_dependency(%q<appium_lib_core>.freeze, ["~> 1.7.2"])
      s.add_dependency(%q<tomlrb>.freeze, ["~> 1.1"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 1.8.1", "~> 1.8"])
      s.add_dependency(%q<posix-spawn>.freeze, ["~> 0.3"])
      s.add_dependency(%q<hashdiff>.freeze, ["~> 0.2.2"])
      s.add_dependency(%q<spec>.freeze, [">= 5.3.4", "~> 5.3"])
      s.add_dependency(%q<fakefs>.freeze, ["~> 0.6.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.9.11"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.46.0"])
      s.add_dependency(%q<rainbow>.freeze, ["~> 2.1.0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<appium_lib_core>.freeze, ["~> 1.7.2"])
    s.add_dependency(%q<tomlrb>.freeze, ["~> 1.1"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 1.8.1", "~> 1.8"])
    s.add_dependency(%q<posix-spawn>.freeze, ["~> 0.3"])
    s.add_dependency(%q<hashdiff>.freeze, ["~> 0.2.2"])
    s.add_dependency(%q<spec>.freeze, [">= 5.3.4", "~> 5.3"])
    s.add_dependency(%q<fakefs>.freeze, ["~> 0.6.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9.11"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.46.0"])
    s.add_dependency(%q<rainbow>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end
