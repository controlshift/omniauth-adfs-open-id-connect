# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class AdfsOpenIdConnect < OmniAuth::Strategies::OAuth2
      option :name, 'adfs_openid_connect'

      DEFAULT_SCOPE = 'openid profile email'

      def client
        options.authorize_params.scope = (options.scope if options.respond_to?(:scope) && options.scope) || DEFAULT_SCOPE

        options.client_options.authorize_url = "#{options.base_adfs_url}/adfs/oauth2/authorize"
        options.client_options.token_url = "#{options.base_adfs_url}/adfs/oauth2/token"

        super
      end

      uid {
        raw_info['oid']
      }

      info do
        {
            name: raw_info['name'],
            email: raw_info['email'] || raw_info['upn'],
            nickname: raw_info['unique_name'],
            first_name: raw_info['given_name'],
            last_name: raw_info['family_name']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
