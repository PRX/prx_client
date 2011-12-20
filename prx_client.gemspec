# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "prx/client/version"

Gem::Specification.new do |s|
  s.name        = "prx_client"
  s.version     = PRX::Client::VERSION
  s.authors     = ["Andrew Kuklewicz"]
  s.email       = ["andrew@prx.org"]
  s.homepage    = "http://labs.prx.org"
  s.summary     = %q{Client for PRX OAuth2 API (v2) }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_runtime_dependency "iconv"
  s.add_runtime_dependency 'yajl-ruby'
  s.add_runtime_dependency "i18n"
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "oauth2"

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "test-unit"
  s.add_development_dependency 'fakeweb'
  
end
