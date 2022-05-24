source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 7.0.3'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'figaro', '~> 1.2.0'

gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.0.0'
  gem 'shoulda-matchers', '5.1.0', group: :test
  gem 'simplecov', '0.21.2', require: false, group: :test
end

group :development do
  gem 'web-console'

  gem 'spring', '2.1.1'
  gem 'spring-commands-rspec', '1.0.4'

  gem 'guard', '~> 2.18.0'
  gem 'guard-rspec', '~> 4.7.3', require: false
end

install_if -> { RUBY_PLATFORM.include?('darwin') } do
  gem 'terminal-notifier-guard', '1.7', group: :development
  gem 'terminal-notifier',       '2.0', group: :development
end

install_if -> { RUBY_PLATFORM.include?('linux') } do
  gem 'libnotify',               '0.9.4', group: :development
end
