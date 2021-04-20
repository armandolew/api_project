class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  def bearer
    return unless request.headers['Bearer']
    request.headers['Bearer']
  end

  def current_company
    @current_company ||= Company.find_by!(token: bearer)
  end
end
