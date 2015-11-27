# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coinprism/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.authors = ["Joran Kikke"]
  spec.description = %q{Simple wrapper for the CoinPrism Bitcoin Asset API}
  spec.email = ['joran.k@gmail.com']
  spec.files = %w(.document CONTRIBUTING.md LICENSE.md README.md Rakefile coinprism.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.homepage = 'https://github.com/ProjectEntropy/coinprism'
  spec.licenses = ['MIT']
  spec.name = 'coinprism'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.2'
  spec.required_rubygems_version = '>= 1.3.5'
  spec.summary = "Ruby toolkit for working with the CoinPrism API"
  spec.version = Coinprism::VERSION.dup
end
