# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "watir-page-helper"
  s.version     = "1.0.2"
  s.authors     = ["Alister Scott","Mark Ryall"]
  s.email       = ["alister.scott@gmail.com"]
  s.description = %q{DEPRECATED - This is a page helper for Watir-WebDriver that allows use easy access to elements. See watirwebdriver.com}
  s.summary = %q{DEPRECATED - A page helper for Watir-WebDriver that allows use easy access to elements.}

  s.rubyforge_project = 'watir-page-helper'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.licenses = ['MIT']

  s.add_runtime_dependency 'watir-webdriver'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'

  s.post_install_message = %{
    (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)

    Watir-page-helper has now been END-OF_LIFED.
    You should now use the page-object gem.
    Please see this blog post for further details: http://wp.me/p98zF-k0

    (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)

}
end