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

      DEFAULT_SITE              = 'http://connect.recruitmilitary.com'
      DEFAULT_AUTHORIZE_PATH    = '/auth/authorize'
      DEFAULT_ACCESS_TOKEN_PATH = '/auth/access_token'
      DEFAULT_USER_DATA_PATH    = '/auth/user.json'

      attr_accessor :site, :authorize_url, :access_token_url, :user_data_url
      attr_accessor :authorize_path, :access_token_path, :user_data_path

      def initialize(options = {})
        @site = options.fetch(:site, DEFAULT_SITE)
        @authorize_path = options.fetch(:authorize_path, DEFAULT_AUTHORIZE_PATH)
        @access_token_path = options.fetch(:access_token_path, DEFAULT_ACCESS_TOKEN_PATH)
        @user_data_path = options.fetch(:user_data_path, DEFAULT_USER_DATA_PATH)
      end

      def authorize_path=(authorize_path)
        @authorize_path = authorize_path
        @authorize_url  = nil
      end

      def access_token_path=(access_token_path)
        @access_token_path = access_token_path
        @access_token_url  = nil
      end

      def user_data_path(user_data_path)
        @user_data_path = user_data_path
        @user_data_url  = nil
      end

      def authorize_url
        @authorize_url || @site + @authorize_path
      end

      def access_token_url
        @access_token_url || @site + @access_token_path
      end

      def user_data_url
        @user_data_url || @site + @user_data_path
      end
    end

  end
end
