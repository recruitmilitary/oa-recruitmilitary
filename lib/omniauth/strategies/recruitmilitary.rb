require 'omniauth/oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Recruitmilitary < OAuth2

      def initialize(app, api_key = nil, secret_key = nil, options = {}, &block)
        client_options = {
          :site             => RecruitMilitary.configuration.site,
          :authorize_url    => RecruitMilitary.configuration.authorize_url,
          :access_token_url => RecruitMilitary.configuration.access_token_url,
        }
        super(app, :recruitmilitary, api_key, secret_key, client_options, &block)
      end

      protected

      def user_data
        @data ||= MultiJson.decode(@access_token.get(RecruitMilitary.configuration.user_data_url))
      end

      def request_phase
        options[:scope] ||= "read"
        super
      end

      def user_hash
        user_data['user']
      end

      def auth_hash
        OmniAuth::Utils.deep_merge(super, {
            'uid' => user_hash["id"],
            'user_info' => user_hash['user_info'],
            'extra' => {
              'email' => user_hash['email'],
              'roles' => user_hash['roles'],
              'first_name' => user_hash['first_name'],
              'last_name' => user_hash['last_name']
            }
          })
      end
    end
  end
end
