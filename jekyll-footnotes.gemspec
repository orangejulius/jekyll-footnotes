# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/footnotes/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-footnotes"
  spec.version       = Jekyll::Footnotes::VERSION
  spec.authors       = ["Julian Simioni"]
  spec.email         = ["julian@simioni.org"]
  spec.summary       = %q{A Jekyll plugin for footnotes}
  spec.description   = %q{A Jekyll plugin that allows you to easily add
  footnotes to your pages. Includes links to the footnote body, backlinks, and
  classes for styling.}
  spec.homepage      = "https://github.com/orangejulius/jekyll-footnotes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.4"
end
