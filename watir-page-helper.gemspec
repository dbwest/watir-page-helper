# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "watir-page-helper"
  s.version     = "0.5.0"
  s.authors     = ["Alister Scott","Mark Ryall"]
  s.email       = ["alister.scott@gmail.com"]
  s.homepage    = "https://github.com/alisterscott/watir-page-helper"
  s.description = %q{This is a page helper for Watir/Watir-WebDriver that allows use easy access to elements. See watir.com}
  s.summary = %q{A page helper for Watir/Watir-WebDriver that allows use easy access to elements.}

  s.rubyforge_project = 'watir-page-helper'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.licenses = ['MIT']

  s.add_runtime_dependency 'ripl'
  s.add_runtime_dependency 'watir-webdriver'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
end
