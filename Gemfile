source 'https://rubygems.org'
ruby '2.2.1'

gem 'rest-client'

gem 'jruby-openssl', :platforms => :jruby
gem 'rake'

group :development do
  gem 'awesome_print', :require => 'ap'
  gem 'guard-rspec', '~> 4.5'
  gem 'hirb-unicode'
  gem 'pry'
  gem 'redcarpet'
  gem 'wirb'
  gem 'wirble'
  gem 'yard'
  gem 'jeweler'
end


group :test do
  gem 'coveralls', :require => false
  gem 'json', '~> 1.7', :platforms => [:jruby]
  gem 'multi_json', '~> 1.11.0'
  gem 'mime-types', '< 2.0.0'
  gem 'netrc', '~> 0.7.7'
  gem 'rb-fsevent', '~> 0.9'
  gem 'rspec', '~> 3.0.0'
  gem 'shoulda'
  gem 'simplecov', :require => false
  gem 'vcr', '~> 2.9.2'
  gem 'webmock', '>= 1.9'
end

gemspec
