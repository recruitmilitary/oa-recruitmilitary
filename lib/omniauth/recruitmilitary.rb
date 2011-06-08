require 'omniauth/strategies/recruitmilitary'

module OmniAuth
  module RecruitMilitary

    extend self

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    class Configuration

      DEFAULT_SITE             = 'http://connect.recruitmilitary.com'
      DEFAULT_AUTHORIZE_URL    = '/auth/authorize'
      DEFAULT_ACCESS_TOKEN_URL = '/auth/access_token'
      DEFAULT_USER_DATA_URL    = '/auth/user.json'

      attr_accessor :site, :authorize_url, :access_token_url, :user_data_url

      def initialize(options = {})
        @site = DEFAULT_SITE
      end

      def authorize_url
        @site + DEFAULT_AUTHORIZE_URL
      end

      def access_token_url
        @site + DEFAULT_ACCESS_TOKEN_URL
      end

      def user_data_url
        @site + DEFAULT_USER_DATA_URL
      end
    end

  end
end
