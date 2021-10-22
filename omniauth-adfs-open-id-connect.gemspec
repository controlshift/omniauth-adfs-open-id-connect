# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# stub: omniauth-adfs-open-id-connect 1.0.0 ruby lib

$:.push File.expand_path( '../lib', __FILE__ )
require 'omniauth/adfs_open_id_connect/version'

# https://guides.rubygems.org/specification-reference/
#
Gem::Specification.new do |s|
  s.name                  = 'omniauth-adfs'
  s.version               = Omniauth::Adfs::OpenId::Connect::VERSION
  s.date                  = '2021-10-22'
  s.summary               = 'OAuth 2 authentication with Active Directory Federations Services OpenId Connect.'
  s.authors               = [ 'Diego Marcet' ]
  s.email                 = [ 'systems@controlshiftlabs.com' ]
    s.homepage              = 'https://github.com/'

  s.required_ruby_version = Gem::Requirement.new('>= 2.7.0')
  s.require_paths         = ['lib']

  s.add_runtime_dependency('omniauth-oauth2', '~> 1.7')
end
