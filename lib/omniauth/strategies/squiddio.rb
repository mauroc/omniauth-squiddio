require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Squiddio < OmniAuth::Strategies::OAuth2

      option :name, "squiddio"


      option :client_options, {
        :site => "https://squidd.io" ,
        :authorize_path => "/oauth/authorize",
        :token_path => "/oauth/token"
        #:access_token_path => "/oauth/token"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"],
          :first_name => raw_info["firstName"],
          :last_name  => raw_info["lastName"],
          :boat => {
          	:id    => raw_info["boat"]["id"],
                :name  => raw_info["boat"]["name"],
                :mmsi  => raw_info["boat"]["mmsi"]
          }
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/signalk/api/v1/users/me').parsed
      end

      def build_access_token
        Rails.logger.debug "Omniauth build access token"
        options.token_params.merge!(:headers => {'Authorization' => basic_auth_header, 'Content-Type' => 'application/x-www-form-urlencoded' })
        super
      end

      def basic_auth_header
        "Basic " + Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      end

    end
  end
end
