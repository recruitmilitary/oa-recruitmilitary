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
      DEFAULT_AUTHORIZE_URL    = DEFAULT_SITE + '/auth/authorize'
      DEFAULT_ACCESS_TOKEN_URL = DEFAULT_SITE + "/auth/access_token"
      DEFAULT_USER_DATA_URL    = '/auth/user.json'

      attr_accessor :site, :authorize_url, :access_token_url, :user_data_url

      def initialize(options = {})
        self.site             = DEFAULT_SITE
        self.authorize_url    = DEFAULT_AUTHORIZE_URL
        self.access_token_url = DEFAULT_ACCESS_TOKEN_URL
        self.user_data_url    = DEFAULT_USER_DATA_URL
      end

    end

  end
end
