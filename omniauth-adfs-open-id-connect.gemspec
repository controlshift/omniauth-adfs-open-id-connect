# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/adfs_open_id_connect/version'

Gem::Specification.new do |s|
  s.name                  = 'omniauth-adfs-open-id-connect'
  s.version               = OmniAuth::Adfs::OpenId::Connect::VERSION
  s.summary               = 'OAuth 2 authentication with Active Directory Federations Services OpenId Connect.'
  s.authors               = ['Diego Marcet']
  s.email                 = ['systems@controlshiftlabs.com']
  s.homepage              = 'https://github.com/controlshift/omniauth-adfs-open-id-connect'
  s.license               = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files                 = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  s.required_ruby_version = Gem::Requirement.new('>= 2.7.0')
  s.require_paths         = ['lib']

  s.add_runtime_dependency('omniauth-oauth2', '~> 1.7')

  s.add_development_dependency('bundler', '~> 2.1')
  s.add_development_dependency('byebug', '~> 11.1')
  s.add_development_dependency('rake', '~> 13.0')
  s.add_development_dependency('rspec', '~> 3.0')
  s.add_development_dependency('rubocop')
  s.add_development_dependency('rubocop-performance')
end
