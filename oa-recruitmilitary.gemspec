# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth/recruitmilitary/version"

Gem::Specification.new do |s|
  s.name        = "oa-recruitmilitary"
  s.version     = OmniAuth::Recruitmilitary::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michael Guterl"]
  s.email       = ["mguterl@gmail.com"]
  s.homepage    = "http://connect.recruitmilitary.com"
  s.summary     = %q{OmniAuth extension for RecruitMilitary.com authentication}
  s.description = %q{OmniAuth extension for RecruitMilitary.com authentication}

  s.rubyforge_project = "oa-recruitmilitary"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth', '~> 0.2.6'

  s.add_development_dependency 'rspec', '~> 2.6'
end
