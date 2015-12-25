#require 'omniauth-oauth2'
#require 'omniauth'
require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Squiddio < OmniAuth::Strategies::OAuth

      option :name, "squiddio"

      option :client_options, {
        :site => "https://squidd.io",
        :authorize_url => "https://squidd.io/oauth/authorize",
        :token_url => "https://squidd.io/oauth/token"
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
                :mmsi  => ray_info["boat"]["id"]
          }
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/signalk/api/v1/users/me').parsed
      end
    end
  end
end
