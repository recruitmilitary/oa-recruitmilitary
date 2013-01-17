require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Recruitmilitary < ::OmniAuth::Strategies::OAuth2
      option :name, "recruitmilitary"

      option :client_options, {
        :site => ::OmniAuth::RecruitMilitary.configuration.site,
        :authorize_url => ::OmniAuth::RecruitMilitary.configuration.authorize_url,
        :token_url => ::OmniAuth::RecruitMilitary.configuration.access_token_url,
      }

      uid{ user_hash['id'] }

      info do
        {
          :name => user_name,
          :email => user_hash['email'],
        }
      end

      # TODO: We probably should just provide user_hash here instead of
      # specifying each attribute. This is evidenced by the fact that we had
      # add pay_grade_id here.
      extra do
        {
          'email' => user_hash['email'],
          'roles' => user_hash['roles'],
          'first_name' => user_hash['first_name'],
          'last_name' => user_hash['last_name'],
          'military_branch_id' => user_hash['military_branch_id'],
          'military_status_id' => user_hash['military_status_id'],
          'gender_id' => user_hash['gender_id'],
          'pay_grade_id' => user_hash['pay_grade_id'],
        }
      end

      def raw_info
        @raw_info ||= @access_token.get(RecruitMilitary.configuration.user_data_url).parsed
      end

      def user_hash
        raw_info['user']
      end

      def user_name
        [
         user_hash['first_name'],
         user_hash['last_name'],
        ].join(' ')
      end

    end
  end
end
