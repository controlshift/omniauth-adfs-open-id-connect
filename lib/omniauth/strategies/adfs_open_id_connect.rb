# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class AdfsOpenIdConnect < OmniAuth::Strategies::OAuth2
      option :name, 'adfs_openid_connect'

      DEFAULT_SCOPE = 'openid profile email'

      def client
        options.authorize_params.scope =
          (options.scope if options.respond_to?(:scope) && options.scope) || DEFAULT_SCOPE

        options.client_options.authorize_url = "#{options.base_adfs_url}/adfs/oauth2/authorize"
        options.client_options.token_url = "#{options.base_adfs_url}/adfs/oauth2/token"

        super
      end

      uid do
        raw_info['unique_name']
      end

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

      # The omniauth-azure-activedirectory-v2 gem implements the raw_info method as follows.
      # It's unclear if this is required for AD FS, but will implement with the fallback on
      # the ID token just as a precaution and we can later remove and use access_token.token directly
      # if it's not needed.
      #
      # Some account types from Microsoft seem to only have a decodable ID token,
      # with JWT unable to decode the access token. Information is limited in those
      # cases. Other account types provide an expanded set of data inside the auth
      # token, which does decode as a JWT.
      #
      # Merge the two, allowing the expanded auth token data to overwrite the ID
      # token data if keys collide, and use this as raw info.
      #
      def raw_info
        if @raw_info.nil?
          id_token_data = begin
            ::JWT.decode(access_token.params['id_token'], nil, false).first
          rescue StandardError
            # no-op, ignore the error if token decoding fails
          end
          auth_token_data = begin
            ::JWT.decode(access_token.token, nil, false).first
          rescue StandardError
            # no-op, ignore the error if token decoding fails
          end

          id_token_data.merge!(auth_token_data)
          @raw_info = id_token_data
        end

        @raw_info
      end
    end
  end
end
