module OmniAuth
  module Strategies
    class Bedwatch < OmniAuth::Strategies::OAuth2
      option :name, :bedwatch

      option :client_options, {
        site: "https://dev.bedwatch.com",
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {email: raw_info["email"], name: raw_info["name"], tenant: raw_info["tenant"]}
      end

      def raw_info
        # logger.debug { '=========inside raw=========='}
        @raw_info ||= access_token.get('/api/user').parsed
        # logger.debug {@raw_info}
      end
    end
  end
end
