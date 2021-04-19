module Api
  class ApiController < ApplicationController
    before_action :authenticate

    private

    def authenticate
      authenticate_or_request_with_http_token do |token, _options|
        authentication = Authentication.find_by!(token: token)

        return authentication.user
      end
    end

    def current_user
      @current_user ||= authenticate
    end
  end
end
