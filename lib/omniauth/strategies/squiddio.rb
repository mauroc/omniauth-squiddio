require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Squiddio < OmniAuth::Strategies::OAuth2

      option :name, "squiddio"


      option :client_options, {
        :site => "https://squidd.io" ,
        :authorize_path => "/oauth/authorize",
        :token_path => "/oauth/token"
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
        @raw_info ||= access_token.get('/apps/api/v1/users/me').parsed
      end

    end
  end
end
