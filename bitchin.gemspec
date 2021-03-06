# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bitchin/version"

Gem::Specification.new do |s|
  s.name        = "bitchin"
  s.version     = Bitchin::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Kittrell"]
  s.email       = ["ben@garbageburrito.com"]
  s.homepage    = ""
  s.summary     = %q{Write a gem summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "bitchin"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
