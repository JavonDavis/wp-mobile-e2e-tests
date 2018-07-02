# -*- encoding: utf-8 -*-
# stub: parallel_appium 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "parallel_appium".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Javon Davis".freeze]
  s.bindir = "exe".freeze
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIEhTCCAu2gAwIBAgIBATANBgkqhkiG9w0BAQsFADBEMRYwFAYDVQQDDA1qYXZv\nbmxkYXZpczE0MRUwEwYKCZImiZPyLGQBGRYFZ21haWwxEzARBgoJkiaJk/IsZAEZ\nFgNjb20wHhcNMTgwNjA2MTcxNjM2WhcNMTkwNjA2MTcxNjM2WjBEMRYwFAYDVQQD\nDA1qYXZvbmxkYXZpczE0MRUwEwYKCZImiZPyLGQBGRYFZ21haWwxEzARBgoJkiaJ\nk/IsZAEZFgNjb20wggGiMA0GCSqGSIb3DQEBAQUAA4IBjwAwggGKAoIBgQDCwCJw\nCoVPoQgQSDGGGRWyt40oMNZHFc85AiRjBU7UMFgYSPQIt0M+SCyJaptM0pJYGG65\nM/hx4Hnqw93ELvPWtAAHgP/9u05K3uiWgsxFRHm5S9JxMS/nvNRatVYvy2hKQGTU\nzJpczncAhu0Lj9tlCuZMdvnhh9PAInrNaXQMkkk4n/XV9dk3lhyqemMFyKJhS0dO\nk3JTn3muVdSOdLMOGJtreHdV5TByA/rIYQGraIqHrlbAbnGOnNunMk53M9eI3zAq\ngz8fydEkaHswv7Mbk3kWnN67UMaNUpoElnEEj0242BtXhXeXr9FnqcFLwUrQLXKK\nkc2BjV1CbK7AHMKLfU2yBQJVqEkb+Xu8dAkpHP333adf7KEW8N0vf+639jgBPbxa\ny25Sh4ZQAuue1NVl43Uj7Qkbb2V4epiNr1JhRrpvMSQah2lx9yNs/NtgdZWHtidd\n+3chmKUroK4elci3NKa76G+iwbD/pJkWg0zFt4cg4+pgWdmjX3PLnd0iv2UCAwEA\nAaOBgTB/MAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQWBBSjN7L+WZRc\n/FBz01MZd7lsGI5j7jAiBgNVHREEGzAZgRdqYXZvbmxkYXZpczE0QGdtYWlsLmNv\nbTAiBgNVHRIEGzAZgRdqYXZvbmxkYXZpczE0QGdtYWlsLmNvbTANBgkqhkiG9w0B\nAQsFAAOCAYEAoxRokaBO+VS8xqmPtqEKofcXF2kJDemn9Jn9Begjj7mzqUVHOR9w\n4HHaAY79m1xm+yiveWgOsHvb04GCjR32dJjAcbb7dsg3aXOd49UoQ0lOVtOigH2s\nv5BqR5svvPKoDA8nP0V9pTOxFboJw5dtY+s95Py6mc6nTsK3XdCUS80PiY3xPWS+\npCzJWE1mNMhRndpb9E0BAiimdmo3suQo7EVYQ3tPsnHwaSdv52tt9kW+rpoHFRV5\ngjyXjRGX/lW897Zs2AA7yFb7oVvbaAlGyH2MLVnB5aiTywqE0ZgD9CTgSnGYu0iY\n28Uiprdx/AqGsAVNV8YAsPMEm/81xTXmJ0HRrpyvMHyAXuNPp84t4TsO2DQtAlrU\nXuXlmerWWuxSKZOwV9fJfl+j5fO7bzUyeWK76xvvWGNtIF19xPnGdPpupaClWMHg\npjBkMT4ow4ZhVgBKPDT2jh74b8g2rIDSbkJIj0lf35WXqJqZzseabGPpTbtzJEap\nHIrd7mPILLe3\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2018-06-11"
  s.description = "Through the creation of multiple environments\n this library allows for the distribution of multiple tests across 1 or more\ndevices or simulators. The library uses Selenium Grid and Appium to launch a\nspecified number of web driver and appium instances to spread the test load\nacross available devices".freeze
  s.email = ["javonldavis14@gmail.com".freeze]
  s.executables = ["parallel_appium".freeze]
  s.files = ["exe/parallel_appium".freeze]
  s.homepage = "https://github.com/JavonDavis/Parallel_Appium".freeze
  s.licenses = ["GPL-3.0".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Start multi-threaded appium servers".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<appium_lib>.freeze, ["~> 9.14"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_development_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_development_dependency(%q<parallel>.freeze, ["~> 1.12"])
      s.add_development_dependency(%q<parallel_tests>.freeze, ["~> 2.21"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<appium_lib>.freeze, ["~> 9.14"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_dependency(%q<parallel>.freeze, ["~> 1.12"])
      s.add_dependency(%q<parallel_tests>.freeze, ["~> 2.21"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<appium_lib>.freeze, ["~> 9.14"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_dependency(%q<json>.freeze, ["~> 1.8"])
    s.add_dependency(%q<parallel>.freeze, ["~> 1.12"])
    s.add_dependency(%q<parallel_tests>.freeze, ["~> 2.21"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
